import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardActions from '@material-ui/core/CardActions';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
// import {Props} from './props';

const useStyles = makeStyles({
  root: {
    maxWidth: 345,
    margin: 10,
  },
  media: {
    height: 140,
  },
});
interface Props {
  imgLink: string;
    title?: string;
    content?: string;
    sizeT?: |"h1" | "h4" | "h2" | "h3" | "h5" | "h6" | "subtitle1" | "subtitle2" | "body1" | "body2" | "srOnly" | undefined ;
    // size_T?:|"h1" | "h4" | "h2" | "h3" | "h5" | "h6" | "subtitle1" | "subtitle2" | "body1" | "body2" | "srOnly" | undefined;
    sizeC?: | "h1" | "h4" | "h2" | "h3" | "h5" | "h6" | "subtitle1" | "subtitle2" | "body1" | "body2" | "srOnly" | undefined;
    colorT?: string;
    colorC?: string;
    // variant?: any;  
}
export default function MediaCard({imgLink, title, content, sizeT, sizeC, colorC, colorT} : Props) {
  const classes = useStyles();
  // const size_T = (sizeT === null) ?  "h5" : sizeT ;
  // const size_C = (sizeC === null) ?  "body2" : sizeC ;
  // const color_T = (colorT === null) ?  "#000000" : colorT ;
  // const color_C = (colorC === null) ?  "#000000" : colorC ;

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