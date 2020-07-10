import React, { useState, useEffect }from 'react';
import ReactDOM from 'react-dom';
import { Grid, Box, Container } from "@material-ui/core";
import {Cards} from './Cards';
import BackToTop from './nav';
import {Heading} from './title';
import Para from './Para';
function App() {

  return (
    <div>
    <BackToTop>
        <Heading
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
      <Cards 
        imgLink1=".." 
        title1="LIzard" 
        content1="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
          across all continents except Antarctica"
        title_size1= ""
        content_size1=""
        title_color1=""
        content_color1=""
        imgLink2=".." 
        title2="LIzard" 
        content2="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
          across all continents except Antarctica"
        title_size2= ""
        content_size2=""
        title_color2=""
        content_color2=""
        imgLink3=".." 
        title3="LIzard" 
        content3="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
          across all continents except Antarctica"
        title_size3 = ""
        content_size3=""
        title_color3=""
        content_color3=""
      />
          <Para 
        title="afhjbfj" 
        content="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." 
        title_size = ""
        content_size=""
        title_color=""
        content_color=""
        />
          <Cards 
        imgLink1=".." 
        title1="LIzard" 
        content1="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
          across all continents except Antarctica"
        title_size1= ""
        content_size1=""
        title_color1=""
        content_color1=""
        imgLink2=".." 
        title2="LIzard" 
        content2="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
          across all continents except Antarctica"
        title_size2= ""
        content_size2=""
        title_color2=""
        content_color2=""
        imgLink3=".." 
        title3="LIzard" 
        content3="Lizards are a widespread group of squamate reptiles, with over 6,000 species, ranging
          across all continents except Antarctica"
        title_size3 = ""
        content_size3=""
        title_color3=""
        content_color3=""
      />
         
        </BackToTop>
        
     </div>
  );
}

ReactDOM.render(<App />, document.querySelector('#root'));