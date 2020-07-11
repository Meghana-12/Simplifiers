export type Props= {
    imgLink?: string;
    title?: string;
    content?: string;
    sizeT?: |"h1" | "h4" | "h2" | "h3" | "h5" | "h6" | "subtitle1" | "subtitle2" | "body1" | "body2" | "srOnly" | undefined ;
    // size_T?:|"h1" | "h4" | "h2" | "h3" | "h5" | "h6" | "subtitle1" | "subtitle2" | "body1" | "body2" | "srOnly" | undefined;
    sizeC?: | "h1" | "h4" | "h2" | "h3" | "h5" | "h6" | "subtitle1" | "subtitle2" | "body1" | "body2" | "srOnly" | undefined;
    colorT?: string;
    colorC?: string;
    // variant?: any;    
}

export type GProps= {
    spacing?: any;
    container?: boolean;
    direction?: string;
    justify?: string;
    alignItems?: string;
} 