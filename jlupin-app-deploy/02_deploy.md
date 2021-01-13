# Example microservice architecture - Exchange

If the scripts in the previous step finished successfully go to the [webcontrol](https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].environments.katacoda.com/webcontrol/) panel and see that one of the microservices is not in state `RUNNING`.

Also if you go the [exchange application](https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/exchange/), you'll see, that currency conversion is not working correctly, due to the fact, that one of microservices is missing. JLupin takes care of that and prevents failure in the whole cluster, thus in the table with 
conversion results only one currency is missing, the rest are calculated correctly.

In order to start the missing application you can either use the webcontrol panel or the CLI. Instructions for both variants are below.

## Starting the service using CLI

1. Start the control CLI:
`/opt/jlupin/platform/start/control.sh`{{execute}}
![CLI started](assets/cli-start.png)

2. List the microservices:
`> microservice list`
![Missing microservice](assets/cli-missing-service.png)

3. Notice which service is not running and start it:
`> microservice start currency-converter-eur`

4. After several seconds you'll se the confirmation in the console that the service started:
![Service started](assets/cli-notification.png)

5. List all microservices again:
![Service started](assets/cli-complete-list.png)



## Starting the service using webcontrol

1. Open webcontrol panel in the new tab: [webcontrol](https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].environments.katacoda.com/webcontrol/). Login using these credentials:
  - username: `admin`
  - password: `admin`
![Service started](assets/wc-login.png)

2. Open second tab "Microservice" in the table at the bottom of the page.
![Service started](assets/wc-table-tab.png)

3. Find missing microservice and in the dropdown select action "start".
![Service started](assets/wc-dropdown-select.png)

4. Wait a couple of seconds, you should see a notification that jlupin finished the command. You can test the currency conversion again and see the difference: [exchange application](https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/exchange/).
![Service started](assets/wc-notification.png)
