/**
 * Created by guillaume.rebmann on 2/10/17.
 */
({
    doInit:function(component,event,helper){

        helper.init(component);

    },getDisplayTotal:function(component,event,helper){
        return component.get('v.total') > 0?(Math.round(component.get('v.total'))+'%'):'';
    },sendMedia:function(component,event,helper){
                                var timestamp = moment(Date.now()).toJSON();
                                var collectionId = component.get('v.objectId');

                                component.set('v.isRunning',true);

                                helper.init(component);

                                helper.syncObject({
                                    timestamp:timestamp,
                                    collectionId:collectionId,
                                    object:'Collection',
                                    total:null,
                                    media:true
                                 },component,helper,null)
                                .then($A.getCallback(function(result){
                                    console.log('COLLECTION => Success');

                                    var status = component.get('v.progressData');
                                                    helper.changeProgressValue(status,'Schedules','completed');
                                                    helper.changeProgressValue(status,'Collection','completed');
                                                    helper.changeProgressValue(status,'Products','active');
                                                    component.set('v.progressData',status);
                                                    component.set('v.progressStatus',component.get('v.progressStatus')+2*component.get('v.progressStatusStep'));

                                    return helper.syncObject({
                                                timestamp:timestamp,
                                                collectionId:collectionId,
                                                object:'Products',
                                                total:null,
                                                media:true
                                           },component,helper,null);

                                }))
                                .then($A.getCallback(function(result){
                                    console.log('PRODUCTS => Success');

                                    var status = component.get('v.progressData');
                                                    helper.changeProgressValue(status,'Products','completed');
                                                    helper.changeProgressValue(status,'Variants','active');
                                                    component.set('v.progressData',status);
                                                    component.set('v.progressStatus',component.get('v.progressStatus')+component.get('v.progressStatusStep'));

                                    return helper.syncObject({
                                                timestamp:timestamp,
                                                collectionId:collectionId,
                                                object:'Variants',
                                                total:null,
                                                media:true
                                           },component,helper,null);

                                }))
                                .then($A.getCallback(function(result){
                                    console.log('VARIANTS => Success');

                                    var status = component.get('v.progressData');
                                                    helper.changeProgressValue(status,'Variants','completed');
                                                    helper.changeProgressValue(status,'Deallines','completed');
                                                    component.set('v.progressData',status);
                                                    component.set('v.progressStatus',component.get('v.progressStatus')+1*component.get('v.progressStatusStep'));
                                        component.set('v.isRunning',false);
                                        component.set('v.message','Success');
                                }))
                                .catch(function(e){
                                        component.set('v.isRunning',false);
                                        component.set('v.message','Error');
                                      // Something went wrong
                                      console('An error occurred : ' + e.message);
                                });
    },sendAll:function(component,event,helper){

                        var timestamp = moment(Date.now()).toJSON();
                        var collectionId = component.get('v.objectId');

                        component.set('v.isRunning',true);
                        helper.init(component);


                        helper.syncObject({
                            timestamp:timestamp,
                            collectionId:collectionId,
                            object:'Schedules',
                            total:null,
                            media:false
                        },component,helper,null)
                        .then($A.getCallback(function(result){
                            console.log('SCHEDULES => Success');

                            var status = component.get('v.progressData');
                                            helper.changeProgressValue(status,'Schedules','completed');
                                            helper.changeProgressValue(status,'Collection','active');
                                            component.set('v.progressData',status);
                                            component.set('v.progressStatus',component.get('v.progressStatus')+component.get('v.progressStatusStep'));
                            return helper.syncObject({
                                        timestamp:timestamp,
                                        collectionId:collectionId,
                                        object:'Collection',
                                        total:null,
                                        media:false
                                     },component,helper,null);


                        }))
                        .then($A.getCallback(function(result){
                            console.log('COLLECTION => Success');

                            var status = component.get('v.progressData');
                                            helper.changeProgressValue(status,'Collection','completed');
                                            helper.changeProgressValue(status,'Products','active');
                                            component.set('v.progressData',status);
                                            component.set('v.progressStatus',component.get('v.progressStatus')+component.get('v.progressStatusStep'));

                            return helper.syncObject({
                                        timestamp:timestamp,
                                        collectionId:collectionId,
                                        object:'Products',
                                        total:null,
                                        media:false
                                   },component,helper,null);

                        }))
                        .then($A.getCallback(function(result){
                            console.log('PRODUCTS => Success');

                            var status = component.get('v.progressData');
                                            helper.changeProgressValue(status,'Products','completed');
                                            helper.changeProgressValue(status,'Variants','active');
                                            component.set('v.progressData',status);
                                            component.set('v.progressStatus',component.get('v.progressStatus')+component.get('v.progressStatusStep'));

                            return helper.syncObject({
                                        timestamp:timestamp,
                                        collectionId:collectionId,
                                        object:'Variants',
                                        total:null,
                                        media:false
                                   },component,helper,null);

                        }))
                        .then($A.getCallback(function(result){
                            console.log('VARIANTS => Success');

                            var status = component.get('v.progressData');
                                            helper.changeProgressValue(status,'Variants','completed');
                                            helper.changeProgressValue(status,'Deallines','active');
                                            component.set('v.progressData',status);
                                            component.set('v.progressStatus',component.get('v.progressStatus')+component.get('v.progressStatusStep'));

                            return helper.syncObject({
                                            timestamp:timestamp,
                                            collectionId:collectionId,
                                            object:'Deallines',
                                            total:null,
                                            media:false
                                            },component,helper,null);

                        }))
                        .then($A.getCallback(function(result){
                            console.log('DEALLINES => Success');
                            console.log(result);

                             var status = component.get('v.progressData');
                                                        helper.changeProgressValue(status,'Deallines','completed');
                                                        component.set('v.progressData',status);



                            component.set('v.isRunning',false);
                            component.set('v.message','Success');
                        }))
                        .catch(function(e){
                             component.set('v.isRunning',false);
                             component.set('v.message','Error');
                              // Something went wrong
                              console('An error occurred : ' + e.message);
                        });
    }
})