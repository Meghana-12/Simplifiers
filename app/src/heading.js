import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { Grid, Box, Container } from "@material-ui/core";
import { findByLabelText } from '@testing-library/react';

const useStyles = makeStyles({
  root: {
    // minWidth: 275,
    marginTop: 60,
    // width: 1500,
    height: 500,
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'center',
    marginLeft: 50,
  },
  bullet: {
    display: 'inline-block',
    // margin: '0 2px',
    transform: 'scale(0.8)',
  },
  title: {
    fontSize: 14,
  },
  pos: {
    marginBottom: 12,
  },
});

export function Heading(x) {
  const classes = useStyles();
  var title_size = (x.sizeT === "") ?  "h1" : x.sizeT ;
  var content_size = (x.sizeC === "") ?  "h4" : x.sizeC ;
  var title_color = (x.colorT === "") ?  "#000000" : x.colorT ;
  var content_color = (x.colorC === "") ?  "#000000" : x.colorC ;
  return (
    <div className={classes.root} >
     
 
         <Typography variant={title_size} component="h2" style={{color:title_color } } >
        {x.title}
        </Typography>

        <br/>
        <Typography variant={content_size} component="h2"style={{color:content_color } }>
         {x.content}
        </Typography>

      </div>
  
  );
}
