/**
 * Created by guillaume.rebmann on 3/7/17.
 */
({
    onInit:function(component,event,helper){
            helper.getObjects(component)
            .then($A.getCallback(function(res){
                component.set('v.productIds',res);
            }))
            .catch(function(res){
                console.log('Rejected');
                console.log(res);
            });
    },handleEvent:function(component,event,helper){
        var type = event.getParam("type");
        switch(type){
            case "edit":

                $A.util.removeClass(component.find('editorModal'), 'hidden');
            break;

           default: console.log('Default');
        }


    },
    cancel:function(component,event,helper){
        $A.util.addClass(component.find('editorModal'), 'hidden');
    },
    mouseMove:function(event){
            event.preventDefault();


    },
    mouseDown:function(component,event,helper){
        event.preventDefault();


        var obj = component.find('resizeContainer').getElement();
        global.dragEditableImage.selected = obj;
        global.dragEditableImage.element.x = event.clientX - obj.offsetLeft;
        global.dragEditableImage.element.y = event.clientY - obj.offsetTop;

        document.addEventListener("mousemove",global.move);



    },
    mouseUp:function(component,event,helper){
        event.preventDefault();
        document.removeEventListener("mousemove", global.move);

        if(global.dragEditableImage.selected !== null){
            global.dragEditableImage.selected = null;
        }

        if(global.dragEditableImage.current != null){
            global.dragEditableImage.current = null;
        }




    }
})