// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TestStruct{
    struct Car{
        string model;
        uint year;
        address owner;
    }

    Car public  car;
    Car[] public  cars;
    mapping ( address => Car) public carMap;

    function test() public {
        car = Car("BMW", 2018, msg.sender);

        Car memory bwd = Car("BMW", 2018, msg.sender);
        Car memory lambo= Car({model:"lambo",year:2019,owner:msg.sender});

        Car memory tesla;
         tesla.model="tesla";
         tesla.year=2020;
         tesla.owner=msg.sender;
         cars.push(bwd);
         cars.push(lambo);
         cars.push(tesla);

         cars.push(Car("cherry",2025,msg.sender));


         Car storage _car=cars[0];
         _car.model="audi";
         delete _car.owner;
         delete  cars[1];

         carMap[msg.sender]=cars[cars.length-1];



    }


}