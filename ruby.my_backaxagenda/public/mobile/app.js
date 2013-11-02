Ext.application({
    name: 'Ext.ux.TouchCalendarEvents',
    launch: function(){

        var calendarView = Ext.create('Ext.ux.TouchCalendarView', {
            minDate: Ext.Date.add(new Date(), Ext.Date.DAY, -46),
            maxDate: Ext.Date.add(new Date(), Ext.Date.DAY, 60),
            viewMode: 'day',
            weekStart: 0,
            value: new Date(),
            eventStore: eventStore,
            
            plugins: [Ext.create('Ext.ux.TouchCalendarEvents', {
                eventHeight: 'auto'
		// eventBarTpl: '<div>{event}</div><div>{title}</div>'
            })]
        });
        
        var calendarPanel = new Ext.Panel({
            fullscreen: true,
            layout: 'fit',
            items: [calendarView, {
                xtype: 'toolbar',
                docked: 'top',
                items: [{
                    xtype: 'button',
                    text: 'Month View',
                    handler: function(){
                        calendarView.setViewMode('month');
                    }
                }, {
                    xtype: 'button',
                    text: 'Week View',
                    handler: function(){
                        calendarView.setViewMode('week');
                    }
                }, {
                    xtype: 'button',
                    text: 'Day View',
                    handler: function(){
                        calendarView.setViewMode('day');
                    }
                }]
            }]
        })
        
        calendarView.on('eventtap', function(event){
            console.log('eventtap');
            Ext.Msg.alert(
                event.get('event'),
                event.get('title')
            );
            //console.log(event);
        });
        calendarView.on('eventdragstart', function(draggable, eventRecord, e){
            console.log('eventdragstart');
            //console.log(arguments);
        });
        calendarView.on('beforeeventdrop', function(draggable, eventRecord, e){
            console.log('beforeeventdrop');
            //console.log(arguments);
            return true;
        });
        calendarView.on('eventdrop', function(draggable, eventRecord, e){
            console.log('eventdrop');
            //console.log(arguments);
        });
        calendarView.on('eventdrag', function(draggable, eventRecord, e){
            console.log('eventdrag');
            //console.log(arguments);
        });
        calendarView.on('periodchange', function(view, minDate, maxDate, direction){
            console.log('periodchange');
            console.log(arguments);
        });
        calendarView.on('selectionchange', function(view, newDate, oldDate){
            console.log('selectionchange');
            console.log(arguments);
        });

    }
    
    
});
