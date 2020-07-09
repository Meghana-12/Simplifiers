

import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles({
  root: {
    maxWidth: 345,
    margin: 10,
  },
  media: {
    height: 140,
  },
});

export default function MediaCard(x) {
  const classes = useStyles();
  var title_size = (x.title_size === "") ?  "h5" : x.title_size ;
  var content_size = (x.content_size === "") ?  "body2" : x.content_size ;
  var title_color = (x.title_color === "") ?  "#000000" : x.title_color ;
  var content_color = (x.content_color === "") ?  "#000000" : x.content_color ;

  return (
    <Card className={classes.root}>
      <CardActionArea>
        <CardMedia
          className={classes.media}
          image={x.imgLink}
          title="img"
        />
        <CardContent>
          <Typography gutterBottom variant={title_size} component="h2" style={{color:title_color } } >
            {x.title}
          </Typography>
          <Typography variant={content_size} color="textSecondary" component="p" style={{color:content_color } } >
            {x.content}
          </Typography>
        </CardContent>
      </CardActionArea>
      <CardActions>
        <Button size="small" color="primary">
          Share
        </Button>
        <Button size="small" color="primary">
          Learn More
        </Button>
      </CardActions>
    </Card>
  );
}
