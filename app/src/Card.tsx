import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
import {Props} from './props';

const useStyles = makeStyles({
  root: {
    maxWidth: 345,
    margin: 10,
  },
  media: {
    height: 140,
  },
});
export function MediaCard({imgLink, title, content, sizeT, sizeC, colorC, colorT} : Props) {
  const classes = useStyles();
  return (
    <Card className={classes.root}>
      <CardActionArea>
        <CardMedia
          className={classes.media}
          image={imgLink}
          title="img"
        />
        <CardContent>
          <Typography gutterBottom variant={sizeT} component="h2" style={{color:colorT } } >
            {title}
          </Typography>
          <Typography variant={sizeC} color="textSecondary" component="p" style={{color:colorC } } >
            {content}
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
MediaCard.defaultProps = {
  sizeT: "h5",
  sizeC: "body2",
};