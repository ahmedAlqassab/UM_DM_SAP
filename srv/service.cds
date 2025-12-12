using { UM_Donations_Management as my } from '../db/schema.cds';

@path: '/service/uM_Donations_Management'
@requires: 'authenticated-user'
service uM_Donations_ManagementSrv {
  @odata.draft.enabled
  entity CurrencyVH as projection on my.CurrencyVH;
  @odata.draft.enabled
  entity CauseVH as projection on my.CauseVH;
  @odata.draft.enabled
  entity Donors as projection on my.Donors;
  @odata.draft.enabled
  entity Donations as projection on my.Donations;
   @odata.draft.enabled
  entity campaignVH as projection on my.campaignVH;
   @odata.draft.enabled
  entity cityVH as projection on my.cityVH;

}