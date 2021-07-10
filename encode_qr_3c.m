function qr=encode_qr_3c(m,s,colored_corners,bw_codes)
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.BarcodeFormat;
if(bw_codes)
    qr_writer=QRCodeWriter;
    M_java=qr_writer.encode(m,BarcodeFormat.QR_CODE,s(2),s(1));
    qr_tmp=zeros(M_java.getHeight(),M_java.getWidth());
    for i=1:M_java.getHeight()
        for j=1:M_java.getWidth()
            qr_tmp(i,j)=M_java.get(j-1,i-1);
        end
    end
    clear qr_writer;
    clear M_java;
    qr=logical(zeros([size(qr_tmp) 3]));
    qr(:,:,1)=qr_tmp;
    qr(:,:,2)=qr_tmp;
    qr(:,:,3)=qr_tmp;
else
    qr=logical(zeros(s(2),s(1),3));
    m_arr=cell(3);
    m_arr{1}=m(1:round(length(m)/3));
    m_arr{2}=m(1:round(length(m)/3)+1:round(2*length(m)/3));
    m_arr{3}=m(round(2*length(m)/3)+1:end);
    for ii=1:3
        message=m_arr{ii};
        qr_writer=QRCodeWriter;
        M_java=qr_writer.encode(message,BarcodeFormat.QR_CODE,s(2),s(1));
        qr_tmp=zeros(M_java.getHeight(),M_java.getWidth());
        for i=1:M_java.getHeight()
            for j=1:M_java.getWidth()
                qr_tmp(i,j)=M_java.get(j-1,i-1);
            end 
        end
        clear qr_writer;
        clear M_java;
        if(size(qr(i,ii))~=size(logical(qr_tmp)))
            fprintf('ERROR : message too long\n');
            qr=logical(zeros(s(2),s(1),3));
            return;
        end
        qr(i,i,ii)=logical(qr_tmp);
    end
end
if(colored_corners)
    ii=1;
    while(qr(ii,ii,1)==0)
        ii=ii+1;
    end
    while(qr(ii,ii,1)==1)
        ii=ii+1;
    end
    while(qr(ii,ii,1)==0)
        ii=ii+1;
    end
    box1=ii;
    while(qr(ii,ii,1)==1)
        ii=ii+1;
    end
    box2=ii-1;
    qr(box1:box2,box1:box2,1)=0;
    qr(box1:box2,box1:box2,2)=1;
    qr(box1:box2,box1:box2,3)=1;
    box_dim=box2-box1;
    ii=size(qr,2);
    jj=1;
    while(qr(jj,ii,1)==0)
        ii=ii-1;
        jj=jj+1;
    end
    while(qr(jj,ii,1)==1)
        ii=ii-1;
        jj=jj+1;
    end
    while(qr(jj,ii,1)==0)
        ii=ii-1;
        jj=jj+1;
    end
    while(qr(jj,ii,1)==1)
        jj=jj-1;
    end
    jj=jj+1;
    while(qr(jj,ii,1)==1)
        ii=ii-1;
    end
    ii=ii+1;
    jjcoords=jj+(0:box_dim);
    iicoords=ii+(0:box_dim);
    qr(jjcoords,iicoords,1)=1;
    qr(jjcoords,iicoords,2)=0;
    qr(jjcoords,iicoords,3)=1;
    ii=1;
    jj=size(qr,1);
    while(qr(jj,ii,1)==0)
        ii=ii+1;
        jj=jj-1;
    end
    while(qr(jj,ii,1)==1)
        ii=ii+1;
        jj=jj-1;
    end
    while(qr(jj,ii,1)==0)
        ii=ii+1;
        jj=jj-1;
    end
    while(qr(jj,ii,1)==1)
        jj=jj-1;
    end
    jj=jj+1;
    while(qr(jj,ii,1)==0)
        ii=ii-1;
    end
    ii=ii+1;
    jjcoords=jj+(0:box_dim);
    iicoords=ii+(0:box_dim);
    qr(jjcoords,iicoords,1)=1;
    qr(jjcoords,iicoords,2)=1;
    qr(jjcoords,iicoords,3)=0;
end