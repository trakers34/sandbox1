/**
 * Created by guillaume.rebmann on 4/3/17.
 */
({
        onInit:function(component,event,helper){
          helper.handleBorder(component,null);
        },
        editClick:function(component,event,helper){
            /*
            var compEvent = component.getEvent("Media_image_event");
                compEvent.setParams({"type":"edit","data":{"message":"Hello the world"}});
                compEvent.fire();
            */

        },
        deleteClick:function(component,event,helper){
                var obj = component.get('v.obj');

                if(obj.placeholder){
                    console.log('Placeholder so we don\'t delete');
                    return;
                }


                // To handle the deletion of the additionnal pictures
                if(!obj.placeholder && obj.id == null && (obj.role == "CouponDetail" || obj.role == 'Variant')){
                    component.set('v.obj',null);
                    return;
                }

                helper.deleteImage(component)
                .then(function(res){
                    if(res){
                        var obj =  component.get('v.obj');
                            obj.id = null;
                        if(!obj.required){
                            obj = null;
                        }else{
                            obj.url = res.url;
                            obj.placeholder = true;
                            component.set('v.border','placeholder');
                        }

                        component.set('v.obj',obj);
                    }
                });


        },
        dropHandler:function(component,event,helper){
            console.log('DROP');
            //console.log(event.target.className);

            if(event.dataTransfer.files.length > 0){
                helper.fileToImage(event.target,event.dataTransfer.files[0]).then($A.getCallback(function(res){
                    if(!helper.imageSizeCheck(res.image,component.get('v.obj').imageType)){
                        res.image.src = res.oldImageSrc;
                    }else{
                        helper.manageUpload(component,helper,res.image.src);
                    }
                }));
            }else{
                event.dataTransfer.dropEffect = 'copy';

                helper.getBase64(component)
                .then($A.getCallback(function(res){
                    console.log(res);
                    var oldImageSrc = event.target.src;
                        event.target.src = res;
                        console.log(event.target.src);
                        if(!helper.imageSizeCheck(event.target,component.get('v.obj').imageType)){
                            event.target.src = oldImageSrc;
                        }else{
                            helper.manageUpload(component,helper,event.target.src);
                        }
                }));

            }

            event.stopPropagation();
            event.preventDefault();


        },
        dragHandler:function(component,event,helper){
            event.preventDefault();
        },
        dragStart:function(component,event,helper){
            console.log('drag start');
            var that = event.target;
                        event.dataTransfer.effectAllowed = 'copy';
                        event.dataTransfer.setData('src',that.src);
        },
        dragEnd:function(component,event,helper){
            console.log('Drag end');
        },
        clickHandler:function(component,event,helper){
            event.preventDefault();
            var parent = event.target.parentElement.parentElement.parentElement;
            var input = parent.getElementsByClassName("imageInput")[0];
                        input.value = null;
                        input.click();

        },
        clickInputImage:function(component,event,helper){
            event.stopPropagation();
        },
        handleFileChange:function(component,event,helper){
            event.stopPropagation();

            var file = event.target.files[0];
            var parent = event.target.parentElement.parentElement.parentElement;
            var image = parent.getElementsByClassName("imageObject")[0];
            var spinner = parent.getElementsByClassName("spinnerShow")[0];


            helper.fileToImage(image,file).then($A.getCallback(function(res){
                if(!helper.imageSizeCheck(res.image,component.get('v.obj').imageType)){
                    image.src = res.oldImageSrc;
                    helper.handleBorder(component,'error');
                }else{

                    helper.manageUpload(component,helper,image.src);

                }
            }));

        }
})