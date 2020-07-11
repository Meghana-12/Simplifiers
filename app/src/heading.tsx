import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import { Grid, Box, Container } from "@material-ui/core";
import { findByLabelText } from '@testing-library/react';
import {Props} from './props';

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

export function Heading( {title, content, sizeC, colorT, colorC, sizeT} : Props ) {
  const classes = useStyles();
  return (
    <div className={classes.root} >
         <Typography variant={sizeT} component="h2" style={{color:colorT } } >
        {title}
        </Typography>

        <br/>
        <Typography variant={sizeC} component="h2"style={{color:colorC } }>
         {content}
        </Typography>

      </div>
  
  );
}
// default values
Heading.defaultProps = {
  sizeT: "h1",
  sizeC: "h4",
  colorT: "#e68a00",
  colorC: "#e68a00",
};