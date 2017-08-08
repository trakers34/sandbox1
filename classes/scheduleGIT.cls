/**
 * Created by guillaume.rebmann on 6/21/17.
 */

public with sharing class scheduleGIT implements Schedulable{

    public String target {get;set;}
    public Static String SECURITY_KEY = '123JKJIJOJKHIULKOIJUHNKO123OSD';
    public Static String URL = 'https://boiling-shore-35292.herokuapp.com';

    public scheduleGIT(String target){
        this.target = target;
    }

    public void execute(SchedulableContext SC) {
        process(this.target);
        System.abortJob(SC.getTriggerId());
    }

    public static void init(){
        Map<String,bounceback__GitSettings__c> settings = bounceback__GitSettings__c.getAll();
        for (String key : settings.keySet()) {
            process(key);
        }
        // hello test
    }

    @Future (callout=true)
    public static void process(String target){
        Datetime currentDatetime = Datetime.now();

        Map<String,Object> returned = new Map<String,Object>{
                'security_key'   => SECURITY_KEY,
                'org_id'        => UserInfo.getOrganizationId()
        };

        bounceback__GitSettings__c settings = bounceback__GitSettings__c.getValues(target);


        returned.put('settings',new Map<String,Object>{
                'name'          => target,
                'apex'          => settings.bounceback__IncludeApexClasses__c,
                'trigger'       => settings.bounceback__IncludeTriggers__c,
                'page'          => settings.bounceback__IncludeVisualForcePages__c,
                'component'     => settings.bounceback__IncludeComponents__c,
                'git' => new Map<String,String>{
                        'username'      => settings.bounceback__UsernameGIT__c,
                        'email'         => settings.bounceback__EmailGIT__c,
                        'repository'    => settings.bounceback__RepositoryGIT__c,
                        'path'          => settings.bounceback__PathGIT__c,
                        'branch'        => settings.bounceback__branchGit__c == null ? 'master':settings.bounceback__branchGit__c,
                        'type'          => settings.bounceback__Type__c.toLowerCase(),
                        'token'         => settings.bounceback__TokenGit__c
                },
                'cursor'        => null,//settings.bounceback__CurrentSelector__c,
                'namespace'     => settings.bounceback__Namespace__c
        });




        Datetime dateSelector = settings.bounceback__CurrentSelector__c; // Custom Setting






        System.debug(JSON.serialize(returned));



        Boolean callWebservice = true; // test

        if(callWebservice && settings.bounceback__TokenGit__c <> null){
            // Here we send the information to server
            HttpRequest req = new HttpRequest();
            req.setMethod('POST');
            req.setTimeout(120000);
            req.setHeader('content-type', 'application/json');
            req.setEndpoint(URL+'/rest/git');
            req.setBody(JSON.serialize(returned));
            System.debug(JSON.serialize(returned));

            Http http = new Http();

            try {

                HTTPResponse res = http.send(req);
                System.debug(res.toString());
                System.debug('STATUS:'+res.getStatus());
                System.debug('STATUS_CODE:'+res.getStatusCode());


                bounceback__GitSettings__c settingToUpdate = bounceback__GitSettings__c.getValues(target);
                settingToUpdate.bounceback__CurrentSelector__c = currentDatetime;
                upsert  settingToUpdate name;
                String chronExpression = '0 0 * * * ?';
                System.schedule( 'Digital Deer GIT - '+target, chronExpression,new scheduleGIT(target));
            } catch(System.CalloutException e) {
                System.debug(e.getMessage());
            }
        }




    }


    public static String filterBuilder(Datetime cursor,String namespace){
        String returned = '';
        if(namespace == null){
            returned +=' NamespacePrefix = null';
        }else{
            returned +=' NamespacePrefix = \''+namespace+'\'';
        }

        if(cursor != null){
            returned +=' AND LastModifiedDate >= '+cursor;
        }

        return returned;

    }



}