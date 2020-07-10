import React, { useState, useEffect }from 'react';
import ReactDOM from 'react-dom';
import { Grid, Box, Container } from "@material-ui/core";
import Card from './Card';
import BackToTop from './nav';
import {Title} from './title';
import Para from './Para';
export function Cards(x) {

  return ( 

   <Grid
    spacing={3}
    container
    direction="row"
    justify="space-evenly"
    alignItems="center"   
  >
    <Card
      imgLink={x.imgLink1}
      title={x.title1}
      content={x.content1}
      title_size = {x.title_size1 }
      content_size={x.content_size1}
      title_color={x.title_color1}
      content_color={x.content_color1}
      />
     <Card 
      imgLink={x.imgLink2}
      title={x.title2}
      content={x.content2}
      title_size = {x.title_size2 }
      content_size={x.content_size2}
      title_color={x.title_color2}
      content_color={x.content_color2}
      />
      <Card 
      imgLink={x.imgLink3}
      title={x.title3}
      content={x.content3}
      title_size = {x.title_size3 }
      content_size={x.content_size3}
      title_color={x.title_color3}
      content_color={x.content_color3}
      />
    </Grid>    

  );
}