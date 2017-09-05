/**
 * Created by guillaume.rebmann on 3/7/17.
 */
({
    onInit:function(component,event,helper){

            helper.loadImage(component)
            .then($A.getCallback(function(result){
                console.log(result);
                component.set('v.Images',result);
                return helper.handleInformation(component);
            }))
            .then($A.getCallback(function(res){
                if(res.name != null){
                    component.set('v.name',res.name);
                    component.set('v.link',res.link);
                }


            }));
    },
    addNewPlaceholder:function(component,event,helper){

        var mapping = {
            'deindeal'  :{label:'Variant Image'     ,imageType:'680x442'        ,role:'Variant'                     ,url:'http://res.cloudinary.com/deindeal-ch/image/upload/v1483694541/sample/VariantImage.jpg'},
            'mystore'   :{label:'Product Image'     ,imageType:'1000x431'       ,role:'MystoreProductImage'         ,url:'http://res.cloudinary.com/deindeal-ch/image/upload/v1493113958/sample/productImage.jpg'},
            'mydeal'    :{label:'Coupon Detail'     ,imageType:'648x432'        ,role:'CouponDetail'                ,url:'http://res.cloudinary.com/deindeal-ch/image/upload/v1491306418/sample/CouponDetail.jpg'}
            }
        var images = component.get('v.Images');
            images.push({
                    imageType:mapping[component.get('v.Platform')].imageType,
                    label:mapping[component.get('v.Platform')].label,
                    placeholder:false,
                    required:false,
                    role:mapping[component.get('v.Platform')].role,
                    targetId:component.get('v.Id'),
                    url:mapping[component.get('v.Platform')].url,
                    droppable:true
                });
        console.log('Id:'+component.get('v.Id'));
        component.set('v.Images',images);

            setTimeout(function(){
                  var container = component.find('imageContainerList').getElement();
                             container.scrollLeft = container.scrollWidth;
                    /*container.querySelector('.addImage').scrollIntoView({
                      behavior: 'smooth'
                    });*/
            }, 100);

    },onSort:function(component,event,helper){
       console.log('Sortable loaded');


       // Components
           var container = component.find('imageContainerList');
           console.log(container);

           // Dragula needs the DOM elements
           var drake = dragula([container.getElement(), container.getElement()], {
               direction: 'horizontal',
               copy: false,
               mirrorContainer: component.find('test').getElement(),
               moves: function (el, container, handle) {
                   return handle.classList.contains('dropArea');
                 },
               accepts:function(el,target,source,sibling){
                   console.log(sibling.classList.contains('droppable'));
                   return sibling.classList.contains('droppable');
               }

           });

           // Show/hide the "Drag and Drop Here" item
           // $A.getCallback makes safe to invoke from outside the Lightning Component lifecycle
           drake.on('drop', $A.getCallback(function(el, target, source, sibling) {
               if (source.children.length <= 1) {
                   //$A.util.removeClass(component.find(helper.placekeeperAuraIdFor(source)), 'slds-hide');
               }
               console.log('DROPPED');
               var order = {};
               var images = document.getElementsByClassName('droppable');
               for(var i = 0; i < images.length; i++){
                   order[images[i].getElementsByClassName('hidden_id')[0].value] = i;
               }

               helper.updateOrders(component,order).then($A.getCallback(function(result){
                   console.log('Order Updated');
                   console.log(result);
               }))

           }));

   }
})