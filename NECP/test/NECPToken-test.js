var NECPToken = artifacts.require("./NECPToken.sol");

contract("NECPToken", function(accounts) {

//CREATION

    // it("creation: should create an initial balance of 30000 for the creator", function(done) {
    //     NECPToken.new({from: accounts[0]}).then(function(ctr) {
    //         return ctr.balanceOf.call(accounts[0]);
    //     }).then(function (result) {
    //         assert.strictEqual(result.toNumber(), 3000000000000);
    //         done();
    //     }).catch(done);
    // });

    // it("creation: test correct setting of vanity information", function(done) {
    //   var ctr;
    //     NECPToken.new({from: accounts[0]})
    //     .then(function(result) {
    //         ctr = result;
    //         return ctr.name.call();
    //     }).then(function (result) {
    //         assert.strictEqual(result, 'Neureal Early Contributor Points');
    //         return ctr.decimals.call();
    //     }).then(function(result) {
    //         assert.strictEqual(result.toNumber(), 8);
    //         return ctr.symbol.call();
    //     }).then(function(result) {
    //         assert.strictEqual(result, 'NECP');
    //         done();
    //     }).catch(done);
    // });


//TRANSERS
//normal transfers without approvals.

    // it("transfers: give ether transfer should be reversed.", function(done) {
    //     NECPToken.new({from: accounts[0]}).then(function(ctr) {
    //         return web3.eth.sendTransaction({from: accounts[0], to: ctr.address, value: web3.toWei("0.01", "Ether")});
    //     }).catch(function(result) {
    //         done();
    //     }).catch(done);
    // });

    // it("transfers: should transfer 100 NECP from accounts[1] to accounts[i]", function(done) {
    //     var ctr;
    //     NECPToken.new({from: accounts[0]}).then(function(result) {
    //         ctr = result;
    //         console.log("NECPToken Contract:" + ctr.address);
    //         for (var i = 1; i < 3; i++) {
    //             ctr.transfer(accounts[i], 10000000000, {from: accounts[0]});
    //         }
    //         //console.log(ctr.balanceOf.call(accounts[2]));
    //         return ctr.transfer(accounts[1], 2000000000, {from: accounts[0]});
    //     }).then(function (result) {
    //         return ctr.balanceOf.call(accounts[1]);
    //     }).then(function (result) {
    //         assert.strictEqual(result.toNumber(), 12000000000);
    //         done();
    //     }).catch(done);
    // });

    // it("transfers: should fail when trying to transfer 30001 to accounts[1] with accounts[0] having 30000", function(done) {
    //     NECPToken.new({from: accounts[0]}).then(function(ctr) {
    //         return ctr.transfer(accounts[1], 3000000000000, {from: accounts[0]});
    //     }).then(function (result) {
    //         assert.isFalse(result);
    //         done();
    //     }).catch(done);
    // });

    // it("transfers: should fail when trying to transfer zero.", function(done) {
    //     var ctr;
    //     NECPToken.new({from: accounts[0]}).then(function(result) {
    //         ctr = result;
    //         return ctr.transfer.call(accounts[1], 0, {from: accounts[0]});
    //     }).then(function (result) {
    //         assert.isFalse(result);
    //         done();
    //     }).catch(done);
    // });

    //NOTE: testing uint256 wrapping is impossible in this standard token since you can't supply > 2^256 -1.

    //todo: transfer max amounts.


//SPECIAL
//test special (non-ERC20) functions

    // it("onlyOwner: accounts[1] (non-owner) should not be able to call", function(done) {
    //     NECPToken.new({from: accounts[0]}).then(function(ctr) {
    //         return ctr.freezeTransfers.call({from: accounts[1]});
    //     }).then(function (result) {
    //         assert.isFalse(result);
    //         done();
    //     }).catch(done);
    // });

    // it("freeze: no accounts should be able to transfer after freeze", function(done) {
    //     var ctr;
    //     NECPToken.new({from: accounts[0]}).then(function(result) {
    //         ctr = result;
    //         console.log("NECPToken Contract:" + ctr.address);
    //         return ctr.freezeTransfers.call({from: accounts[0]});
    //     }).then(function (result) {
    //         for (var i = 0; i < 2; i++) {
    //             ctr.transfer(accounts[i+1], 10000000000, {from: accounts[i]});
    //         }
    //         return ctr.transfer(accounts[1], 2000000000, {from: accounts[0]});
    //     }).then(function (result) {
    //         return ctr.balanceOf.call(accounts[0]);
    //     }).then(function (result) {
    //         assert.strictEqual(result.toNumber(), 3000000000000);
    //         done();
    //     }).catch(done);
    // });

    // it("burn: accounts[0] (reserve) should have 0 token", function(done) {
    //     var ctr;
    //     NECPToken.new({from: accounts[0]}).then(function(result) {
    //         ctr = result;
    //         console.log("NECPToken Contract:" + ctr.address);
    //         return ctr.burnReserveAndFreezeTransfers.call({from: accounts[0]});
    //     }).then(function (result) {
    //         assert.isTrue(result);
    //         console.log("DEBUG:" + ctr.balanceOf.call(accounts[0]));
    //         return ctr.balanceOf.call(accounts[0]);
    //     }).then(function (result) {
    //         assert.strictEqual(result.toNumber(), 0);
    //         done();
    //     }).catch(done);
    // });

});
