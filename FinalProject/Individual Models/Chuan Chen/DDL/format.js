const fs = require('fs');

const data = fs.readFileSync('fixdata.sql', 'utf8').split('\n');

let writeFileName = 'test.sql';

if(true){fs.truncate('writeFileName', 0, function(){console.log('cleared file')})}

let p = (a) => {
    for(let i = 0; i < a.length; i++){
        console.log(i, a[i] + " \n");
    }
}

let count = 0;

for(let i = 0; i < data.length; i++){
    let current = data[i].split(" ");
    /*
    if(current[2].slice(1, current[2].length - 1) === "ManufacturerVehicleStock"){
        current.splice(5, 2); //removes StockId field;
        current.splice(29, 2); //removes null value from stockId
        current.splice(7, 2); //remove modelID
        current.splice(29, 2); //removes null value from ModelId 
        current.splice(23, 0 ,`, "UserAuthorizationId" , "TransactionNumber" , "FireAuditTrigger"`) // adds fields 
        current.splice(current.length - 1, 0, `, 1 , 1 , 'N'`) //adds values for userauth, transacnum, fireaudit;
        if(count++ == 0){
            p(current);
        }
        fs.appendFile(writeFileName, current.join(' ') + "\n", (err) => {return err});
        
    }
        //*/

        
        if(current[2].slice(1, current[2].length - 1) === `Sales"."SalesOrderVehicleDetail`){
            p(current);
            fs.appendFile(writeFileName, current.join(' ') + "\n", (err) => {return err});
        }
   
};
