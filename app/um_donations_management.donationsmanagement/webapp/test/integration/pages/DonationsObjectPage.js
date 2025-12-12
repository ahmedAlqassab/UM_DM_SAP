sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'umdonationsmanagement.donationsmanagement',
            componentId: 'DonationsObjectPage',
            contextPath: '/Donations'
        },
        CustomPageDefinitions
    );
});