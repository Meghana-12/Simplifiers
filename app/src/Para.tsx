import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Typography from '@material-ui/core/Typography';
import { Grid} from "@material-ui/core";
import {Props} from './props';

const useStyles = makeStyles({
  root: {
  margin: 70,
  },
  media: {
    height: 140,
  },
});

export function Para( {title, content, sizeC, colorT, colorC, sizeT} : Props) {
  const classes = useStyles();
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
// default values
Para.defaultProps = {
  sizeT: "h3",
  sizeC: "body1",
  colorT: "#000066",
  colorC: "#000000",
};