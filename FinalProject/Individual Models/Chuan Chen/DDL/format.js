const fs = require('fs');

const data = fs.readFileSync('data.sql', 'utf8').split('\n');

let temp = data[19].split(" ");


//console.log(temp[2].toString().slice(1, temp[2].length-1));


for(let i = 0; i < data.length; i++){
    let current = data[i].split(" ");
    if(current[2].slice(1, current[2].length - 1) === "SalesOrderVehicle"){
        
    }
   
};

