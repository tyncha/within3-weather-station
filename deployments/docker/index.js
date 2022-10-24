const express = require( "express" );
const app = express();

let port = 8080;
if (process.env.ENV === 'prod') { 
    port = process.env.PORT 
}

// define a route handler for the default home page
app.get( "/", ( req, res ) => {
    res.send( `Hello! This assestment done by Tyncht, now you see the finall result. Thank you` );
    
} );


app.listen(port, '0.0.0.0', ()=>{
    console.log(`Server is listening on ${port} and binded 0.0.0.0 port`);
})