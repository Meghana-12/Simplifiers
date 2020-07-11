import React, { useState, useEffect }from 'react';
import ReactDOM from 'react-dom';
import { Grid, Box, Container } from "@material-ui/core";
import Card from './Card';
import Nav from './nav';
import {Heading} from './heading';
import Para from './Para';
function App() {

  return (
    <React.Fragment>
        <Nav
            title="S"
        />
        <Heading
            title ="LIzard" 
            content ="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging across all continents except Antarctica"
            
          />
        <Grid
          spacing  ={3}
          container
          direction  ="row"
          justify  ="space-evenly"
          alignItems  ="center"   
        >
        <Card
            imgLink =".." 
            title ="LIzard" 
            content ="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging across all continents except Antarctica"
          />
          <Card
            imgLink =".." 
            title ="LIzard" 
            content ="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging across all continents except Antarctica"
          />
          <Card
            imgLink =".." 
            title ="LIzard" 
            content ="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging across all continents except Antarctica"
          />
          <Card
            imgLink =".." 
            title ="LIzard" 
            content ="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging across all continents except Antarctica"
          />
          <Card
            imgLink =".." 
            title ="LIzard" 
            content ="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging across all continents except Antarctica"
          />
          <Card
            imgLink =".." 
            title ="LIzard" 
            content ="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging across all continents except Antarctica"
          />
          </Grid>

        </React.Fragment>
     );
   }
   
   ReactDOM.render(<App />, document.querySelector('#root'));
   