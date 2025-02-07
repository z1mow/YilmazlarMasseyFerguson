<%response.Buffer=true
response.Expires= -1
%>

<meta http-equiv="Content-Type" content="text/html; charset=windows-1254" />
<br />
<%'response.Cookies("urun")=""
if urunid<>0 then
	ekleadet = request.Cookies("urun")(cstr(urunid))
	if not isnumeric(ekleadet) then ekleadet = 0
	response.Cookies("urun")(cstr(urunid))= ekleadet + 1
end if%>
<%select case secsiparis
case 1%>

<%toplam=request("toplam")
	if toplam = 0 then call hata("Sepetiniz boş!")
	
	urun=request.Cookies("urun")

if urun<>"" then
urun = split(urun,"&")
urunsay = ubound(urun)

for say = 0 to urunsay
	
	urunidsi = split(urun(say),"=")
	'urunidsi(0) 'urunid
	
	ekleadet = request("adet"&cstr(urunidsi(0)))
	if not isnumeric(ekleadet) then ekleadet = 0
	response.Cookies("urun")(cstr(urunidsi(0)))= cint(ekleadet)
	
next
end if

%>
<form id="form1" name="form1" method="post" action="<%=thispage%>?sec=102">
  <table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="3"><input name="toplam" type="hidden" id="toplam" value="<%=toplam%>" /></td>
    </tr>
    <tr valign="top">
      <td width="100">Ad Soyad</td>
      <td width="10">:</td>
      <td><input name="ad" type="text" id="ad" size="50" maxlength="255" onChange="javascript:faturaad();" onkeyup="javascript:faturaad();" /></td>
    </tr>
    <tr valign="top">
      <td>Email</td>
      <td>:</td>
      <td><input name="email" type="text" id="email" size="50" maxlength="255" /><br />
      Girdikten sonra kontrol ediniz, ilk sipariş sonrası girilen emaile üyelik şifresi gönderilecektir. Sipariş takibini üye girişi ile yapabilirsiniz.<br />(şifre spam/önemsiz posta klasörüne gidebilir)</td>
    </tr>
    <tr valign="top">
      <td>Telefon</td>
      <td>:</td>
      <td><input name="tel" type="text" id="tel" size="50" maxlength="255" /></td>
    </tr>
    <tr valign="top">
      <td>Cep</td>
      <td>:</td>
      <td><input name="cep" type="text" id="cep" size="50" maxlength="255" /></td>
    </tr>
    <tr valign="bottom">
      <td colspan="3" align="center" height="50"><h1>TESLİMAT BİLGİLERİ</h1></td>
    </tr>
    <tr valign="top">
      <td width="100">Ad Soyad / Firma Unvan</td>
      <td width="10">:</td>
      <td><input name="tad" type="text" id="tad" size="50" maxlength="255" /></td>
    </tr>
    <tr valign="top">
      <td>Teslimat Adresi</td>
      <td>:</td>
      <td><textarea name="tadres" id="tadres" cols="45" rows="5"></textarea></td>
    </tr>
    <tr valign="top">
      <td>İl</td>
      <td>:</td>
      <td><select name="ilid" id="ilid">
        <option value="0">-seçiniz-</option>
        <%sql="select * from il order by il"
		rs.open sql,alan,1,3
		do while not rs.eof%>
         <option value="<%=rs("ilid")%>"><%=rs("il")%></option>
        <%rs.movenext
		loop
		rs.close%>
      </select></td>
    </tr>
    <tr valign="bottom">
      <td colspan="3" align="center" height="50"><h1>FATURA BİLGİLERİ</h1></td>
    </tr>
    <tr valign="top">
      <td colspan="3"><input type="radio" name="fatura" id="radio" value="1" onKeyUp="javascript:faturagoster('bireyselfatura');" onChange="javascript:faturagoster('bireyselfatura');" /> Bireysel Fatura - <input type="radio" name="fatura" id="radio" value="2" onKeyUp="javascript:faturagoster('kurumsal');" onChange="javascript:faturagoster('kurumsal');"/> Kurumsal Fatura</td>
    </tr>
    <tr valign="top">
      <td colspan="3">
      <div id="bireyselfatura" style="display:none;">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
      <td width="100">TC Kimlik No</td>
      <td width="10">:</td>
      <td><input name="tckimlikno" type="text" id="tckimlikno" size="50" maxlength="255" /></td>
    </tr>
            <tr valign="top">
      <td width="100">Ad Soyad</td>
      <td width="10">:</td>
      <td><input name="faturaadi" type="text" id="faturaadi" size="50" maxlength="255" disabled="disabled"/></td>
    </tr>
     <tr valign="top">
      <td width="100">Adres</td>
      <td width="10">:</td>
      <td><textarea name="fadres" cols="45" rows="5" id="fadres"></textarea></td>
    </tr>
    <tr valign="top">
      <td>İl</td>
      <td>:</td>
      <td><select name="filid" id="filid">
        <option value="0">-seçiniz-</option>
        <%sql="select * from il order by il"
		rs.open sql,alan,1,3
		do while not rs.eof%>
         <option value="<%=rs("ilid")%>"><%=rs("il")%></option>
        <%rs.movenext
		loop
		rs.close%>
      </select></td>
    </tr>
        </table>
      
      </div>
      
      
       <div id="kurumsal" style=" display:none;">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr valign="top">
      <td width="100">Firma Unvanı</td>
      <td width="10">:</td>
      <td><input name="fad" type="text" id="fad" size="50" maxlength="255" /></td>
    </tr>
            <tr valign="top">
      <td width="100">Vergi Dairesi</td>
      <td width="10">:</td>
      <td><input name="vdaire" type="text" id="vdaire" size="50" maxlength="255"/></td>
    </tr>
       <tr valign="top">
      <td width="100">Vergi No</td>
      <td width="10">:</td>
      <td><input name="vno" type="text" id="vno" size="50" maxlength="255"/></td>
    </tr>
    <tr valign="top">
      <td width="100">Adres</td>
      <td width="10">:</td>
      <td><textarea name="fadres" cols="45" rows="5" id="fadres"></textarea></td>
    </tr>
    <tr valign="top">
      <td>İl</td>
      <td>:</td>
      <td><select name="filid1" id="filid1">
        <option value="0">-seçiniz-</option>
        <%sql="select * from il order by il"
		rs.open sql,alan,1,3
		do while not rs.eof%>
         <option value="<%=rs("ilid")%>"><%=rs("il")%></option>
        <%rs.movenext
		loop
		rs.close%>
      </select></td>
    </tr>
        </table>
      
      </div>&nbsp;</td>
    </tr>
    <tr valign="top">
      <td colspan="3"><h1>Ödeme Şekli</h1></td>
    </tr>
    <tr valign="top">
      <td colspan="3"><table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20"><input type="radio" name="odemesekli" id="radio2" value="1" /></td>
          <td><strong>Havale / EFT</strong></td>
          </tr>
          <tr>
          <td>&nbsp;</td>
          <td>Banka Hesap Numaralarımız</td></tr>
          <tr><td colspan="2" height="5"></td></tr>
          <tr>
          <td><input type="radio" name="odemesekli" id="radio2" value="2" /></td>
          <td><strong>Kapıda Ödeme</strong></td></tr>
          <tr>
          <td>&nbsp;</td>
          <td>Kapıda Ödeme Bilgisi</td></tr>
          <tr><td colspan="2" height="5"></td></tr>
          <tr>
          <td><input type="radio" name="odemesekli" id="radio2" value="3" /></td>
          <td><strong>Kredi Kartı</strong></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td></tr>
          <tr><td colspan="2" height="5"></td></tr>
      </table></td>
    </tr>
    <tr valign="top">
      <td colspan="3"><h1>Sepet bilgisi</h1></td>
    </tr>
    <tr valign="top">
      <td colspan="3">
      
      
       <%siparis = "<table width='100%' cellspacing='0' class='data-table box-table shopping-cart' id='shopping-cart-table'>    <col width='75' />    <col />    <col width='80' />    <col width='1' />    <col width='80' />    <col width='40' />    <thead>        <tr bgcolor='#CCCCCC'>            <th rowspan='1'>&nbsp;</th>            <th rowspan='1'>Ürün Adı</th>                        <th class='a-center' colspan='1'>Adet Fiyatı</th>            <th rowspan='1' class='a-center'>Adet</th>            <th colspan='1' class='a-center'>Ara Toplam</th>            <th rowspan='1' class='a-center'></th>        </tr>            </thead>    <tfoot class='cart-tfoot'>        <tr>            <td colspan='100' align='right' class='a-right'>            </td>        </tr>    </tfoot>    <tbody>"
  urun=request.Cookies("urun")
  if urun<>"" then
  urun = split(urun,"&")
  urunsay = ubound(urun)
  for say = 0 to urunsay
  		urunidsi = split(urun(say),"=")
		sql = "select * from urun where urunid="&urunidsi(0)&";"
		rs.open sql,alan,1,3
		if not rs.eof then
		siparis= siparis &"<tr>    <td width='150'>"
		sql="select * from resim where urunid="&rs("urunid")&" order by sira desc"
		rs1.open sql,alan,1,3
		if not rs1.eof then
		
		siparis= siparis &"<a href='/?sec=15&amp;urunid="&rs("urunid")&"&amp;ustcatid1="&ustcatid1&"&amp;ustcatid="&ustcatid&"&amp;catid="&catid&"'><img src='/urun/"&rs1("resim")&"' style='max-height:110px; max-width:140px;' border='0'></a>"
		end if
		rs1.close
		siparis= siparis &"</td><td class='attributes-col'>        <h4 class='title'>"&(rs("urun"))&"</h4><!-- item custom options --><!-- / --></td><td nowrap='nowrap' class='a-right'><div class='cart-price'><span class='price'>"&rs("fiyat")&"</span></div></td><td align='right' class='a-center'>"&urunidsi(1)&"</td><td align='right' class='a-right'>"&urunidsi(1)*rs("fiyat")&"</td> <td class='a-center'>&nbsp;</td></tr>"
		end if
		rs.close
		next
		end if
		siparis= siparis &"<tr>            <td colspan='100' align='right' class='a-right'>Toplam Tutar: "&toplam&"</td>        </tr>       </tbody></table>"%>
		<%=siparis%>
		
		</td>
    </tr>
    <tr valign="top">
      <td colspan="3" align="right"><input type="submit" name="button2" id="button2" value="Devam" /></td>
    </tr>
  </table>
  
  
</form>


<br>
    <br />
    
<script language="javascript">
faturaad();
</script>

<%case 2%>
<%toplam=cdbl(request("toplam"))
	if toplam = 0 then call hata("Sepetiniz boş!")
	response.Write(toplam)%>
    
    <%ad = request("ad")
	email = request("email")
	cep = request("cep")
	tel = request("tel")
	
	tad = request("tad")
	tadres = request("tadres")
	ilid = cint(request("ilid"))
	
	fatura = cint(request("fatura"))
	tckimlikno = request("tckimlikno")
	fadres = request("fadres")
	filid = cint(request("filid"))
	filid1 = cint(request("filid1"))
	
	fad = request("fad")
	vdaire = request("vdaire")
	vno = request("vno")
	
	odemesekli = cint(request("odemesekli"))
	
	if ad = "" then call hata("Lütfen sipariş veren Ad Soyad bilgisini girin!")
	if email = "" or not isemail(email) then call hata("Lütfen geçerli bir email adresi girin!")
	
	if tel="" and cep="" then call hata("Lütfen en az bir adet telefon girin!")
	
	if tad = "" then call hata("Lütfen Teslim edilecek kişi/kurum adı girin!")
	if tadres = "" then call hata("Lütfen Teslim adresi girin!")
	if ilid = 0 then call hata("Lütfen Teslim edilecek şehri seçin!")
	
	if fadres = "" then call hata("Lütfen fatura adresi girin")
	
	
	if fatura = 1 then
		if tckimlikno = "" then call hata("Lütfen fatura için TC Kimlik No girin!")
		if filid = 0 then call hata("Lütfen fatura için şehir seçin!")
	end if
	
	if fatura = 2 then
		if fad = "" then call hata("Lütfen fatura için Firma adı girin!")
		if vdaire = "" then call hata("Lütfen vergi dairesi girin!")
		if vno = "" then call hata ("Lütfen vergi no girin!")
		filid = filid1
		if filid = 0 then call hata("Lütfen fatura için şehir seçin!")
	end if
	
	response.Cookies("odemesekli")=odemesekli%>
	
	
   <%siparis = "<h1>Alışveriş Sepetim</h1><table width='100%' cellspacing='0' class='data-table box-table shopping-cart' id='shopping-cart-table'>    <col width='75' />    <col />    <col width='80' />    <col width='1' />    <col width='80' />    <col width='40' />    <thead>        <tr bgcolor='#CCCCCC'>            <th rowspan='1'>&nbsp;</th>            <th rowspan='1'>Ürün Adı</th>                        <th class='a-center' colspan='1'>Adet Fiyatı</th>            <th rowspan='1' class='a-center'>Adet</th>            <th colspan='1' class='a-center'>Ara Toplam</th>            <th rowspan='1' class='a-center'></th>        </tr>            </thead>    <tfoot class='cart-tfoot'>        <tr>            <td colspan='100' align='right' class='a-right'>            </td>        </tr>    </tfoot>    <tbody>"
  urun=request.Cookies("urun")
  if urun<>"" then
  urun = split(urun,"&")
  urunsay = ubound(urun)
  for say = 0 to urunsay
  		urunidsi = split(urun(say),"=")
		sql = "select * from urun where urunid="&urunidsi(0)&";"
		rs.open sql,alan,1,3
		if not rs.eof then
		siparis= siparis &"<tr>    <td width='150'>"
		sql="select * from resim where urunid="&rs("urunid")&" order by sira desc"
		rs1.open sql,alan,1,3
		if not rs1.eof then
		
		siparis= siparis &"<a href='/?sec=15&amp;urunid="&rs("urunid")&"&amp;ustcatid1="&ustcatid1&"&amp;ustcatid="&ustcatid&"&amp;catid="&catid&"'><img src='urun/"&rs1("resim")&"' style='max-height:110px; max-width:140px;' border='0'></a>"
		end if
		rs1.close
		siparis= siparis &"</td><td class='attributes-col'>        <h4 class='title'>"&(rs("urun"))&"</h4><!-- item custom options --><!-- / --></td><td nowrap='nowrap' class='a-right'><div class='cart-price'><span class='price'>"&rs("fiyat")&"</span></div></td><td align='right' class='a-center'>"&urunidsi(1)&"</td><td align='right' class='a-right'>"&urunidsi(1)*rs("fiyat")&"</td> <td class='a-center'>&nbsp;</td></tr>"
		end if
		rs.close
		next
		end if
		siparis= siparis &"<tr>            <td colspan='100' align='right' class='a-right'>Toplam Tutar: "&toplam&"</td>        </tr>       </tbody></table>"
		
sql = "select * from uye where email = '"&email&"';"
rs.open sql,alan,1,3
if not rs.eof then
	uyeid = rs("uyeid")
else
	sifrele(5)
	
	kimden = firmaemail
								kime = email
								baslik = sitemiz & " üyeliğiniz gerçekleştirildi!"
								konu1 = sitemiz&" sitesi üyeliği için<br>şifreniz: "& sifre &" <br><br> sipariş takibi için bu üyeliği kullanabilirsiniz.<br><br>"
								
							'gonderildi = gonder(kimden, kime, isim, baslik, konu1, kimden,sunucu,mailkullanici,mailsifre)
							%>
							  <%	If gonderildi Then 
										durum = "Gönderildi"
									Else
										durum = "*****GÖNDERİLMEDİ"
									End If
								%>
<%= durum %> : <%= kime %> 
								<%if  not gonderildi then%>
                                <br /><br />siparişinizi takip için oluşturulan şifreniz emailinize gönderilemedi, telefonla öğrenebilirsiniz.
								<%end if
	rs1.open "uye",alan,1,3
	rs1.addnew
    rs1("ad") = ad
	rs1("sifre") = sifre
	rs1("email") = email
	rs1("cep") = cep
	rs1("tel") = tel
	
	rs1("tad") = tad
	rs1("tadres") = tadres
	rs1("ilid") = ilid
	
	
	rs1("tckimlik") = tckimlikno
	rs1("fadres") = fadres
	rs1("filid") = filid
	
	rs1("fad") = fad
	rs1("vdaire") = vdaire
	rs1("vno") = vno
	rs1("ip")=request.servervariables("remote_Addr")
	rs1.update
	uyeid = rs1("uyeid")
	rs1.close
end if
rs.close%>
	<%
	
	rs1.open "siparis",alan,1,3
	rs1.addnew
    rs1("ad") = ad
	rs1("email") = email
	rs1("cep") = cep
	rs1("tel") = tel
	rs1("uyeid") = uyeid
	rs1("tad") = tad
	rs1("tadres") = tadres
	rs1("ilid") = ilid
	
	
	rs1("tckimlik") = tckimlikno
	rs1("fadres") = fadres
	rs1("filid") = filid
	
	rs1("fad") = fad
	rs1("vdaire") = vdaire
	rs1("vno") = vno
	rs1("ip")=request.servervariables("remote_Addr")
	
	rs1("odemesekli")=odemesekli
	
	rs1("siparis")=siparis
	rs1("toplam")=toplam
	
	rs1.update
	rs1.close
	
	response.Redirect(thispage&"?sec=103")
	
	%>
<%case 3%>
	<%odemesekli = request.Cookies("odemesekli")
	if odemesekli="" then call hata("Hatalı giriş, ödeme şekli belirtilmemiş!")
	odemesekli = cint(odemesekli)
	if odemesekli = 1 then%>
    Siparişiniz kaydedilmiştir, Havale / EFT ödeme seçeneğini seçtiniz. Aşağıda verilen banka hesaplarımıza ödemenizi, açıklama kısmına sipariş verirken kullandığınız ad soyadı belirterek yapabilirsiniz.<br />
<br />
siparişte kullandığınız email adresine şifre gönderilmiştir. Spam / Önemsiz posta klasörünüze gitmiş olabilir. Bu email ve şifre ile giriş yaparak siparişinizi takip edebilirsiniz.
    <%end if%>
    
    <%if odemesekli=2 then%>
    Siparişiniz kaydedilmiştir, Kapıda ödeme seçeneğini seçtiniz. Kısa bir süre sonra verdiğiniz telefonla siparişiniz onaylandıktan sonra siparişiniz gönderilecektir.<br />
<br />
siparişte kullandığınız email adresine şifre gönderilmiştir. Spam / Önemsiz posta klasörünüze gitmiş olabilir. Bu email ve şifre ile giriş yaparak siparişinizi takip edebilirsiniz.
    <%end if%><br /><br /><br />
<a href="/?sec=104">Sepeti Sıfırla, Ürünleri Sil</a>
<%case 4%>
	<%response.Cookies("urun")=""
	response.Redirect("/?sec=100")%>
<%case 5%>
	
    <%if urunid<>0 then
	
	urun=request.Cookies("urun")

if urun<>"" then
urun = split(urun,"&")
urunsay = ubound(urun)

for say = 0 to urunsay
	
	urunidsi = split(urun(say),"=")
	if cint(urunidsi(0)) <> cint(urunid) then
	cerez = cerez & urunidsi(0) &"="&urunidsi(1)
	if say<urunsay then cerez = cerez & "&"
	end if
next
end if
response.cookies("urun") = cerez

end if
closealan
response.Redirect("/?sec=100")%>
<%case else%>
<h1>Alışveriş Sepetim</h1>
<form name="formsiparis" method="post" action="/?sec=101">

<table width="100%" cellspacing="0" class="data-table box-table shopping-cart" id="shopping-cart-table">
    <col width="75" />
    <col />
    <col width="80" />
    <col width="1" />
    <col width="80" />
    <col width="40" />

    <thead>
        <tr bgcolor="#CCCCCC">
            <th rowspan="1">&nbsp;</th>
            <th rowspan="1">Ürün Adı</th>
                        <th class="a-center" colspan="1">Adet Fiyatı</th>
            <th rowspan="1" class="a-center">Adet</th>
            <th colspan="1" class="a-center">Ara Toplam</th>
            <th rowspan="1" class="a-center">Sil</th>
        </tr>
            </thead>
    <tfoot class="cart-tfoot">
        <tr>
            <td colspan="100" align="right" class="a-right">
            <input type="submit" name="button" id="button" value="Sipariş Ver"></td>
        </tr>
    </tfoot>
    <tbody>
    <%urun=request.Cookies("urun")

if urun<>"" then
urun = split(urun,"&")
urunsay = ubound(urun)

for say = 0 to urunsay
	
	urunidsi = split(urun(say),"=")
	if isnumeric(urunidsi(1)) then
		sql = "select * from urun where urunid="&urunidsi(0)&";"
		rs.open sql,alan,1,3
		if not rs.eof then%>
				<tr>
		<td width="150">
			<%sql="select * from resim where urunid="&rs("urunid")&" order by sira desc"
						rs1.open sql,alan,1,3
						if not rs1.eof then%><a href="/?sec=15&amp;urunid=<%=rs("urunid")%>&amp;ustcatid1=<%=ustcatid1%>&amp;ustcatid=<%=ustcatid%>&amp;catid=<%=catid%>"><img src="urun/<%=rs1("resim")%>" style="max-height:110px; max-width:140px;" border="0"></a><%end if
						rs1.close%>
		
		</td>
		<td class="attributes-col">
			<h4 class="title"><%response.Write(rs("urun"))%></h4>
	
		   <!-- item custom options -->
					<!-- / -->
	
				</td>
					<td nowrap="nowrap" class="a-right">
								<div class="cart-price">
			
								<span class="price">
								<input name="adetfiyat<%=rs("urunid")%>" type="hidden" id="adetfiyat<%=rs("urunid")%>" value="<%=rs("fiyat")%>">
								<%=rs("fiyat")%></span>            
			</div>
				</td>
			<td align="right" class="a-center">
			<input name="adet<%=rs("urunid")%>" id="adet<%=rs("urunid")%>" value="<%=urunidsi(1)%>" size="3" class="input_adet" maxlength="8" onKeyUp="javascript:hesapla('<%=rs("urunid")%>');" onChange="javascript:hesapla('<%=rs("urunid")%>');" />
	 </td>
				<td align="right" class="a-right">
								<div class="cart_price" id="fiyat<%=rs("urunid")%>">
			
			</div>
			
	   
	 <script language="javascript">
	  
	  hesapla('<%=rs("urunid")%>');
	  </script>
	
				</td>
			<td class="a-center">
			<a href="/?sec=105&amp;urunid=<%=rs("urunid")%>">
				<img src="img/btn_trash.gif" alt="" width="16" height="16" border="0" />
			</a>
		</td>
	</tr> 
	
		<%end if
            rs.close
        globalid = globalid &","& urunidsi(0)
	end if
next
end if%>
<tr>
            <td colspan="100" align="right" class="a-right">
           <input name="toplam" type="hidden" id="toplam" value="0" />
           <div class="cart_price" id="sonuc">
             
           </div>
        
        <script language="javascript">
  var globalid = '<%=globalid%>';
  globalids = globalid.split(",");
var globaltoplam = 0;
  function toplamlar()
{ globaltoplam = 0;
	for (i=1,j=globalids.length; i<j; i++) {
    temparray = globalids[i];
	adetfiyat = (document.getElementById('fiyat' + globalids[i]).innerHTML).replace(",",".");
	globaltoplam = globaltoplam + parseFloat(adetfiyat);
	
  
}
globaltoplam = (globaltoplam).toString();
globaltoplam = globaltoplam.replace(".",",");
//globaltoplam = globaltoplam.toFixed(2);
	document.getElementById('sonuc').innerHTML = "TOPLAM: " + globaltoplam + " TL";
	document.getElementById('toplam').value = globaltoplam;


}
toplamlar();	
  </script>
            
</td>
        </tr>
       </tbody>
</table>
<br>
<a href="/?sec=104">Sepeti Sıfırla, Ürünleri Sil</a>
</form>
<%end select%>