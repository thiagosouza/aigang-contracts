console.log("working");
const EventEmitter = artifacts.require("./EventEmitter.sol");
const assert = require("chai").assert;

contract("EventEmmiter", function(accounts) {
  describe("Deploy EventEmitter contract", function(){
    it("Catch an instance of EventEmitter contract", function() {
      return new EventEmitter.new().then(function(instance){
        eventEmitter = instance;
      });
    });
  });

  describe("Check if INFO events are raised in EventEmitter contract", function(){
    it("INFO(message) event", function(done) {
      var events = eventEmitter.allEvents();
      eventEmitter.info("TestingInfoWithStringAlone").then(new Promise(
        function(resolve, reject) {
          events.watch(function(error, log){
            resolve(log, done);
          }).then(function(log, done){
            assert.equal(log.event, "Info", "Event must be an INFO");
          }).then(done).catch(done);
        }
      ));
    });
  })
  

  // it("should emit Error event when sending 5 ether", function(done){
  //   var insurance = CarInsurance.deployed();

  //   var events = insurance.allEvents();
  //   insurance.send({from: accounts[0], value: web3.toWei(5, 'ether')}).then(new Promise(
  //     function(resolve, reject){
  //       events.watch(function(error, log){ resolve(log, done); });
  //   }).then(function(log, done){
  //     assert.equal(log.event, "Error", "Event must be an Error");
  //   }).then(done).catch(done));
  // });

});