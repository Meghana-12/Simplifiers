import React, { useState, useEffect }from 'react';
import ReactDOM from 'react-dom';
import { Grid, Box, Container } from "@material-ui/core";
import Card from './Card';
import BackToTop from './nav';
import {Title} from './title';
import Para from './Para';
function App() {

  return (
    <div>
    <BackToTop>
        <Title 
          title="Simplifiers" 
          subtitle="ILP Project" 
          title_size="" 
          title_color="#ff6600"
          content_size="" 
          content_color = "#ff6600"
          />   
      <Para 
        title="afhjbfj" 
        content="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." 
        title_size = ""
        content_size=""
        title_color=""
        content_color=""
        />
     <Grid
          spacing={3}
          container
          direction="row"
          justify="space-evenly"
          alignItems="center"

         
        >
          <Card 
            imgLink=".." 
            title="LIzard" 
            content="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
              across all continents except Antarctica"
            title_size = ""
            content_size=""
            title_color=""
            content_color=""
            />
           <Card 
            imgLink=".." 
            title="LIzard" 
            content="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
            across all continents except Antarctica"
            title_size = ""
            content_size=""
            title_color=""
            content_color=""
            />
             <Card 
             imgLink=".." 
             title="LIzard" 
             content="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
            across all continents except Antarctica"
            title_size = ""
            content_size=""
            title_color=""
            content_color=""
            />
            <Card 
            imgLink=".." 
            title="LIzard" 
            content="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
            across all continents except Antarctica"
            title_size = ""
            content_size=""
            title_color=""
            content_color=""
            />
             <Card 
             imgLink=".." 
             title="LIzard" 
             content="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
            across all continents except Antarctica"
            title_size = ""
            content_size=""
            title_color=""
            content_color=""
            />
          </Grid> 
          
         
        </BackToTop>
        
     </div>
  );
}

ReactDOM.render(<App />, document.querySelector('#root'));