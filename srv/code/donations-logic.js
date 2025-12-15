/**
 * 
 * @Before(event = { "CREATE" }, entity = "uM_Donations_ManagementSrv.Donations")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
    const { amount } = request.data;

    if (amount >= 5000) {
    request.data.donation_tier = 'Exceptional Donation';
} else if (amount >= 3000) {
    request.data.donation_tier = 'Large Donation';
} else if (amount >= 1000) {
    request.data.donation_tier = 'Special Donation';
} else {
    request.data.donation_tier = 'Regular Donation';
}
}