[![Build Status](https://travis-ci.org/mdb/septa_scheduler.svg?branch=master)](https://travis-ci.org/mdb/septa_scheduler)

# septa_scheduler

A simple Sinatra wrapper for finding the next scheduled SEPTA bus/trolley stops closest to an address or lat/long point.

## Endpoints

* `/address?address=<some address>&route=<some route number>`
* `/point?lat=<some lat>&lng=<some long>&route=<some route number>`

Examples:

Get the route 34 stop closest to 5000 Hazel Avenue, the next 4 inbound/outbound scheduled stops, and any relevant SEPTA alerts:

```
/address?address=?address=5000%20Hazel%20Avenue&route=34
```

Get the route 34 stop closest to 39.9539910, -75.1682170, the next 4 inbound/outbound scheduled stops, and any relevant SEPTA alerts:

```
`/point?lat=39.9539910&lng=-75.1682170&route=34`
```
