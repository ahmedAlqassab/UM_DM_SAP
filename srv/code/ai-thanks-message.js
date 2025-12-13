/**
 * 
 * @Before(event = { "CREATE" }, entity = "uM_Donations_ManagementSrv.Donations")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
const { OrchestrationClient, buildAzureContentSafetyFilter} = require('@sap-ai-sdk/orchestration');
module.exports = async function (request) {
	// Your code here
	const { Donors } = cds.entities;
	const { Donations } = cds.entities;
	const donation = request.data;
	const donorID = donation.donor_ID;

	console.log(donation, "**********************");

	if (!donorID) {
		return request.reject(400, 'Donor ID is required.');
	}

	// Fetch the Donor details using the Donor ID
	const donor = await SELECT.one.from(Donors).where({ ID: donorID });
	if (!donor) {
		return request.reject(404, 'Donor not found.');
	}
	console.log(donor, "**********************");

	// // Fetch the Donation details using the Donor ID
	// const donations = await SELECT.from(Donations).where({ donor_ID: donorID });
	// if (!donations) {
	// 	return request.reject(404, 'Donor has No Donations');
	// }

	const resultDonor = JSON.stringify(donor, null, 2);
	const resultDonation = JSON.stringify(donation, null, 2);

	// // Placeholder for LLM integration
	// // Here you would call your LLM API with the title, cause, and goalAmount to generate a description
	// // For example:
	// // const generatedDescription = await callLLMApi(title, cause, goalAmount);
	// //LLM Call Begins
	const chatModelName = 'gpt-4o';
	const resourceGroup = 'default';

	const filter = buildAzureContentSafetyFilter({
		Hate: 'ALLOW_SAFE',
		Violence: 'ALLOW_SAFE',
		SelfHarm: 'ALLOW_SAFE',
		Sexual: 'ALLOW_SAFE',
	})
// 	const orchestrationClient = new OrchestrationClient({
//   apiKey: process.env.AICORE_SERVICE_KEY, // use this only locally
// });



	// try {
		const orchestrationClient = new OrchestrationClient(
			{
				promptTemplating: {
					model: {
						name: chatModelName
					},
					prompt: {
						template: [
							{
								role: 'system',
								content: 'You are an AI assistant for donor engagement',
							},
							{
								role: 'user',
								content: `Generate a thank message that expresses heartfelt gratitude for their generous support:
										Donor Details: ${resultDonor}
										Donation details: ${resultDonation}
										My organization name: United Minds Foundation

										do not Write as an email`,
							}
						]
					}
				}
			}
		);
		const response = await orchestrationClient.chatCompletion();
		// console.log(response, 'response#######################');

		const generatedDescription = response.getContent();
		
		console.log(`Successfully executed chat completion. ${generatedDescription}`);
		request.data.message = generatedDescription;
		console.log(request.data, "**********************");
		// Return the generated description
		// return generatedDescription;
	// }
	// catch (error) {
	// 	console.log(
	// 		`Error while generating Donor Description.
	// Error: ${error}`
	// 	);
	// 	throw error;
	// }

}