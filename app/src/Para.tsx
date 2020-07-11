import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import { Grid, Box, Container } from "@material-ui/core";
import {Props} from './props';
import { findByLabelText } from '@testing-library/react';

const useStyles = makeStyles({
  root: {
  margin: 70,
  },
  media: {
    height: 140,
  },
});

export default function Para( {title, content, sizeC, colorT, colorC, sizeT} : Props) {
  const classes = useStyles();
  // var sizeT = (sizeT === null) ?  "h2" : sizeT ;
  // var sizeC = (sizeC === null) ?  "h4" : sizeC ;
  // var colorT = (colorT === null) ?  "#000000" : colorT ;
  // var colorC = (colorC === null) ?  "#000000" : colorC ;

  return (
    <div className= {classes.root}>
        <Grid
            spacing={3}
            container
            direction="column"
            justify="flex-start"
            alignItems="center"
            
            >
            <Typography variant={sizeT} component="h3"  style={{color:colorT } }>
                {title}
            </Typography>
            <Typography variant={sizeC} component="p"  style={{color:colorC } }>
                {content}
            </Typography>
        </Grid> 
    </div>
  );
}

Para.defaultProps = {
  sizeT: "h1",
  sizeC: "h4",
};