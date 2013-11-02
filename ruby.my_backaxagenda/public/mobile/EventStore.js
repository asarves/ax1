Ext.define("Event", {
	extend: "Ext.data.Model",
	config: {
		fields: [{
			name: 'event',
			type: 'string'
		}, {
			name: 'title',
			type: 'string'
		}, {
			name: 'start',
			type: 'date',
			dateFormat: 'c'
		}, {
			name: 'end',
			type: 'date',
			dateFormat: 'c'
		}, {
			name: 'css',
			type: 'string'
		}]
	}
});

// always base events from today
var day = (new Date()).getDate(),
	month = (new Date()).getMonth(),
	year = (new Date()).getFullYear();

var eventStore = Ext.create('Ext.data.Store', {
    model: 'Event',
    storeId : 'Events',
    proxy   : {
	type    : 'ajax',
	// url     : document.location.pathname + '/mobileEventData',
	url: '/axagenda/mobileEventData',
	reader  : {
	    type        : 'json',
	    rootProperty : 'rows'
	}
    },
    autoLoad: true
});
