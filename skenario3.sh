const loadtest = require('loadtest');

function statusCallback(error, result, latency) {
    console.log("rps", process.argv[2])
    console.log('Current latency %j, result %j, error %j', latency, process.argv[2], error);
    console.log('----');
    // console.log('Request elapsed milliseconds: ', result.requestElapsed);
    // console.log('Request index: ', result.requestIndex);
    // console.log('Request loadtest() instance index: ', result.instanceIndex);
}

const options = {
    url: 'http://34.142.244.46:30001/orders',
    method: 'POST',
    maxRequests: 15 * process.argv[2],
    concurrency: 1,
    requestsPerSecond: process.argv[2],
    statusCallback: statusCallback,
    headers: {
        Authorization: 'Basic dXNlcjpwYXNzd29yZA==',
        Cookie: 'grafana_session=4dc46d3b6b0f0f188ed96bf0ae06a933; md.sid=s%3AGmR7jQoPqNWSBi4X5j1nQouRrXq_ngQh.Y3rZUHex9O%2FypE2b%2B9vlVKGwhvMM5Bua9ze8ntzkSqU; logged_in=GmR7jQoPqNWSBi4X5j1nQouRrXq_ngQh'
    },
    body: {
        id: '03fef6ac-1896-4ce8-bd69-b798f85c6e0b',
        quantity: 1
    }
};

loadtest.loadTest(options, function(error) {
    if (error) {
        return console.error('Got an error: %s', error);
    }
    console.log('Tests run successfully');
});