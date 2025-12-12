/**
 * 
 * @Before(event = { "CREATE" }, entity = "uM_Donations_ManagementSrv.Donations")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
  const { Donations } = cds.entities;

  // Get the maximum invoice number from existing donations
  const lastDonation = await SELECT.one.from(Donations).orderBy({ ref: ['invoicenumber'], sort: 'desc' });

  let newInvoiceNumber = 'INV-0001'; // Default invoice number

  if (lastDonation && lastDonation.invoicenumber) {
    const lastInvoiceNumber = lastDonation.invoicenumber;
    const match = lastInvoiceNumber.match(/^INV-(\d+)$/);

    if (match) {
      const lastNumber = parseInt(match[1], 10);
      const nextNumber = lastNumber + 1;
      newInvoiceNumber = `INV-${nextNumber.toString().padStart(4, '0')}`;
    }
  }

  // Set the new invoice number in the request data
  request.data.invoicenumber = newInvoiceNumber;
}