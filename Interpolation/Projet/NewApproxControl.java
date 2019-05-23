package fr.enseeiht.parotcontroler.discretization ;
import android.util.Log ;
import com.parrot.JSproject.drone.JSDrone ;
import java.util.ArrayList ;
import java.util.List ;
public class NewApproxControl extends DiscretizationMethod {
    public static String TAG = " NewApproxControlTAG ";
    private List<Float> pointsXs;
    private List<Float> pointsYs;

    public NewApproxControl (JSDrone mJSDrone , int width , int height ) {
        super(mJSDrone , width , height );
        this.duration = 0.06;
    }
    @Override
    public ArrayList <List <Float >> transformation (List <Float > pointsXs ,
                                                     List <Float > pointsYs ) {
        this.pointsXs = pointsXs;
        this.pointsYs = pointsYs;
        List <Float > X_list = new ArrayList ();
        List <Float > Y_list = new ArrayList ();

        /** On choisi les B-Splines */
        List <Float > BordX = new ArrayList();
        List <Float > BordY = new ArrayList();
        List <Float > resultatX = X_list;
        List <Float > resultatY =  

        try {
        } catch ( Exception e) {
            X_list = pointsXs ;
            Y_list = pointsYs ;
            Log.d(TAG , " Error in the code !");
        }

        /* END TODO */

        ArrayList <List <Float >> res = new ArrayList <List <Float > >();
        res.add( X_list );
        res.add( Y_list );
        return res ;
    }
}