

import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import { Grid, Box, Container } from "@material-ui/core";

import { findByLabelText } from '@testing-library/react';

const useStyles = makeStyles({
  root: {
  margin: 70,
  },
  media: {
    height: 140,
  },
});

export default function Para(x) {
  const classes = useStyles();
  var title_size = (x.sizeT === "") ?  "h2" : x.sizeT ;
  var content_size = (x.sizeC === "") ?  "h4" : x.sizeC ;
  var title_color = (x.colorT === "") ?  "#000000" : x.colorT ;
  var content_color = (x.colorC === "") ?  "#000000" : x.colorC ;

  return (
    <div className= {classes.root}>
        <Grid
            spacing={3}
            container
            direction="column"
            justify="flex-start"
            alignItems="center"
            
            >
            <Typography variant={title_size} component="h3"  style={{color:title_color } }>
                {x.title}
            </Typography>
            <Typography varient={content_size} component="p"  style={{color:content_color } }>
                {x.content}
            </Typography>
        </Grid> 
    </div>
  );
}
