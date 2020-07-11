import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import {Props} from './props';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    margin: 0,
  },
  title: {
    flexGrow: 1,
  },
}));

export function  Nav({title, sizeT, colorT, colorC}: Props) {
  const classes = useStyles();

  return (
    <div className={classes.root} >
      <AppBar position="static">
        <Toolbar>
          <Typography variant={sizeT} className={classes.title} style={{color:colorT}}>
            {title}
          </Typography>
        </Toolbar>
      </AppBar>
    </div>
  );
}
// default values
Nav.defaultProps = {
    sizeT: "h5",
  };