/**
 * Created by guillaume.rebmann on 4/3/17.
 */
({
    fileToImage:function(image,file){

        return new Promise(function (resolve, reject) {
                           var reader  = new FileReader();
                           var oldImageSrc = image.src;
                            //console.log('oldImageSrc => '+oldImageSrc);
                           reader.onloadend = function () {
                               image.src = reader.result;
                               resolve({image:image,oldImageSrc:oldImageSrc});
                           }

                           if (file) {
                               reader.readAsDataURL(file); //reads the data as a URL
                           } else {
                               image.src = "";
                           }
        });

     },
     imageSizeCheck:function(image,size){
         var sizes = size.split("x"); // width x height

         console.log(sizes[0] +'!='+ image.naturalWidth);
         console.log(sizes[1] +'!='+ image.naturalHeight);

         if( (((image.src.length)/ 1.37) / 1000) > 200){
             console.log('Size is too big');
             return false;
         }

         if(sizes[0] != image.naturalWidth || sizes[1] != image.naturalHeight){
             console.log('Image format is not matching');
             //throw new Error("The size of the image is not correct, it should be : "+sizes[0]+"x"+sizes[1]);
             return false;
         }else{
             return true;
         }




     },
     deleteImage:function(component){
         var action = component.get('c.deleteImage');
                     action.setParams({
                        objectId : component.get('v.obj').id
                     });

         var that = this;
         return new Promise(function(resolve, reject){
             action.setCallback(that, function(response) {

                 var state = response.getState();
                 var res   = action.getReturnValue();
                  if(state === "SUCCESS") {
                     resolve(res);
                  }else{
                     reject(res);
                  }
             });
             $A.enqueueAction(action);
         })
     },
     uploadImage:function(component,data,folder){
        var action = component.get('c.uploadImage');
        //console.log(data);

             action.setParams({
                objectId : component.get('v.obj').id,
                folder:folder,
                data:data,
                targetId:component.get('v.obj').targetId,
                role:component.get('v.obj').role
             });

         var that = this;
         return new Promise(function(resolve, reject){
             action.setCallback(that, function(response) {

                 var state = response.getState();
                 var res   = action.getReturnValue();

                  if(state === "SUCCESS") {
                     resolve(res);
                  }else{
                     reject(response.getError());
                  }
             });
             $A.enqueueAction(action);
         })
     },
     handleFolder:function(component){
                  var action = component.get('c.handleFolder');

                  action.setParams({
                     targetId:component.get('v.obj').targetId,
                  });

                  var that = this;
                  return new Promise(function(resolve, reject){
                      action.setCallback(that, function(response) {

                          var state = response.getState();
                          var res   = action.getReturnValue();

                           if(state === "SUCCESS") {
                              resolve(res);
                           }else{
                               reject(response.getError());
                           }
                      });
                      $A.enqueueAction(action);
                  })
     },
     handleBorder:function(component,value){
         var obj = component.get('v.obj');

         if(value != null){
             component.set('v.border',value);
         }else{
             if(obj.placeholder){
                 component.set('v.border','placeholder');
             }
         }
     },
     manageUpload:function(component,helper,src){
         helper.handleBorder(component,'loading');

         var obj = component.get('v.obj');
         helper.handleFolder(component).then($A.getCallback(function(res){
             return helper.uploadImage(component,src,res);
         })).then($A.getCallback(function(res){
             console.log('image uploaded');
             console.log(res);

             //Clone value
                 var obj = {};
                 for(var key in component.get('v.obj')){
                     obj[key] = component.get('v.obj')[key];
                 }

                obj.id          = res.id;
                obj.positioning = res.positioning;
                obj.url         = res.url;
                obj.placeholder = res.placeholder;

                component.set('v.obj',obj);

                 helper.handleBorder(component,'loaded');

         })).catch(function(res){
             console.log('Got Rejected');
             console.log(res);
             helper.handleBorder(component,'error');
         });
     },
     getBase64:function(component){

         var action = component.get('c.getBase64');

           action.setParams({
              imageId:component.get('v.obj').id,
           });

           var that = this;
           return new Promise(function(resolve, reject){
               action.setCallback(that, function(response) {

                   var state = response.getState();
                   var res   = action.getReturnValue();

                    if(state === "SUCCESS") {
                       resolve(res);
                    }else{
                       reject(response.getError());
                    }
               });
               $A.enqueueAction(action);
           })


     }
})