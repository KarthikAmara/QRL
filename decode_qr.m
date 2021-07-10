function message = decode_qr(img)
m='Kallam Haranadha Reddy institute of technology';
import com.google.zxing.qrcode.QRCodeReader.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource.*;
import com.google.zxing.BinaryBitmap.*;
import com.google.zxing.common.HybridBinarizer.*;
import com.google.zxing.Result.*;
import com.google.zxing.client.result.ResultParser.*;
import com.google.zxing.qrcode.*;
import com.google.zxing.client.j2se.*;
import com.google.zxing.*;
import com.google.zxing.common.*;
import com.google.zxing.Result.*;

j_img = im2java2d(img);
source = BufferedImageLuminanceSource(j_img);

bitmap = BinaryBitmap(HybridBinarizer(source));

qr_reader = QRCodeReader;

try 
    result = qr_reader.decode(bitmap);
    %parsedResult = ResultParser.parseResult(result);
    message = char(result.getText());
catch e
    message = [];        
end
clear source;
clear j_img;
clear bitmap;







disp(m);