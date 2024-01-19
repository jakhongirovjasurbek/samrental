sealed class Constants {
  static String baseUrl = 'http://164.92.117.144:2021/v1';
  static String imageBaseUrl = 'http://164.92.117.144:2021/v1/file/cars';

  static String htmlContent = '''
<div style="width: 100%"><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 700; line-height: 20px; word-wrap: break-word">1. Rental Period:<br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 400; line-height: 20px; word-wrap: break-word">   - The rental period begins on the date specified in the rental agreement and ends on the date also specified in the agreement.<br/>   - Any extension of the rental period must be agreed upon in writing and may be subject to additional fees.<br/><br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 700; line-height: 20px; word-wrap: break-word">2. Payment:<br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 400; line-height: 20px; word-wrap: break-word">   - Payment for the rental is due in full at the start of the rental period.<br/>   - Acceptable forms of payment include [list acceptable payment methods].<br/>   - Late payments may be subject to additional charges and may result in the termination of the rental agreement.<br/><br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 700; line-height: 20px; word-wrap: break-word">3. Security Deposit:<br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 400; line-height: 20px; word-wrap: break-word">   - A security deposit may be required and is refundable upon the satisfactory return of the rented item in its original condition.<br/>   - The deposit will be used to cover any damages, losses, or additional charges incurred during the rental period.<br/><br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 700; line-height: 20px; word-wrap: break-word">Use and Care of Rented Items:<br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 400; line-height: 20px; word-wrap: break-word">   - The renter is responsible for the proper use and care of the rented items.<br/>   - The items must be returned in the same condition as when they were rented.<br/>   - Any damage, loss, or excessive wear and tear will be charged to the renter.<br/><br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 700; line-height: 20px; word-wrap: break-word">5. Prohibited Uses:<br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 400; line-height: 20px; word-wrap: break-word">   - Rented items may not be used for illegal or hazardous activities.<br/>   - [List any specific activities or uses that are prohibited.]<br/><br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 700; line-height: 20px; word-wrap: break-word">6. **Insurance:**<br/></span><span style="color: #1A1A1A; font-size: 15px; font-family: SF Pro Text; font-weight: 400; line-height: 20px; word-wrap: break-word">   - The renter is encouraged to obtain their own insurance to cover any damage, loss, or liability associated with the rented items.<br/>   - [Your Company Name] is not responsible for any loss or damage to personal property used in conjunction with the rented items.<br/><br/>7. **Delivery and Return:**<br/>   - [Specify delivery and return options and any associated fees.]<br/>   - The renter is responsible for any costs associated with transportation, including pickup and delivery, unless otherwise specified in the rental agreement.<br/><br/>8. **Cancellation and Refund:**<br/>   - Cancellations must be made in writing and are subject to [Your Company Name]'s cancellation policy, which may include fees or forfeited deposits.<br/><br/>9. **Liability:**<br/>   - The renter assumes all responsibility for the rented items during the rental period.<br/>   - [Your Company Name] is not liable for any injuries, damages, or losses incurred during the use of the rented items.<br/><br/>10. **Termination of Agreement:**<br/>    - [Your Company Name] reserves the right to terminate the rental agreement at any time due to violations of these terms and conditions or for any other reasonable cause.<br/><br/>11. **Indemnification:**<br/>    - The renter agrees to indemnify and hold [Your Company Name] harmless from any claims, costs, damages, or liability incurred as a result of the rental agreement.<br/><br/>12. **Entire Agreement:**<br/>    - This rental agreement constitutes the entire agreement between the parties, and no other representations or warranties, whether written or oral, will be binding.<br/><br/>13. **Governing Law:**<br/>    - This agreement is governed by the laws of [Your Jurisdiction]. Any disputes arising from this agreement will be resolved in the courts of [Your Jurisdiction].<br/><br/>By entering into a rental agreement with [Your Company Name], you acknowledge that you have read, understood, and agreed to these terms and conditions. It is your responsibility to ask for clarification on any terms you do not understand before signing the agreement. Failure to adhere to these terms may result in the termination of the rental agreement and additional charges.</span></div>
''';

  static String rentalTerms = '''
            Ижарага берувчи мажбур:
  Ушбу шартномани имзолашдан олдин механизмлар, компонентлар ва агрегатларнинг ишлашини текшириб ижарага олувчига ТВ ни соз холда топширишга.
  ТВ белгиланган муддат вақт ичида, техник жиҳатдан соз ҳолатда қабул қилиш ва ўтказиш далолатномасига мувофиқ жиҳозланган ва ОСАГО (мажбурий суғурта) бўйича суғурталанган ҳолда бериш.
  ТВ ижарага беришдан олдин ижарага берувчи шахс Шартноманинг (Илова №2) асосан ЙУРИКНОМА утказади.
 
            Ижарага берувчи ҳақли:
  Ушбу шартномани бир томонлама бекор қилиш ва ТВ нинг ишлаш қоидалари ва ижарага олувчи томонидан ушбу шартнома шартлари бузилган тақдирда ТВнинг кайтарилишини талаб қилиш.
  Ижарага берувчи шартномада кўрсатилган вақт ичида ижарага олувчидан хар хил холатлар юзасидан шубхаланган тақдирда ТВни чақиртириб техник ҳолатидан хабардор бўлиши.
  ТВни ташқи ва ички қисми ифлосланганлиги сабабли уларни тозалашни талаб қилиш.
 
            Ижарага олувчи мажбур:
  Ушбу шартнома матни билан танишиш. Ушбу шартнома шартларига риоя қилиш, шунингдек ТВ ни фақат мақсадга мувофиқ равишда бошқариш.
  Йўл ҳаракати қоидаларига қатъий риоя қилиш ва уларнинг бузилиши учун мавжуд қонун ҳужжатларига мувофиқ жавобгар бўлиш
  Автомобилни ижарага олиш вақтида камчиликлари бўлса текшириб кўздан кечириб олиш.
  Шартнома муддати тугагач, ТВга ўз вақтида қайтариш, ғилдираклар, эҳтиёт қисмлар, механизмлар, бутловчи қисмлар матор ва хадавой қисимларини соз холда топшириш, ТВни техник жиҳатдан яроқли ва тоза ҳолатда қайтариш.
  Иш вақтида аниқланган автомобил носозликлари, шикастланиш ҳолатлари ва йўл-транспорт ҳодисалари ҳақида ижарага берувчига дарҳол хабар бериш.
  Ижарага олувчининг айби билан транспорт воситаси бузилган тақдирда, ижарага берувчига хабар бериб, ижарага олувчи ўз маблағглари ҳисобидан, ижарага берувчининг техник хизмат кўрсатиш станциясида таъмирлаш ишларини олиб боради. 
  Истисно ҳолатларда, ижарага берувчининг рухсати билан бошқа ТХСларида таъмирлаш ишларини олиб бориш ва ТХС да турган хар бир кун учун ижарага берувчига хар кунлик тўловларни тўлаб бориши.
  ТВни тоза ҳолатда ва ёқилги миқдори қабул қилингандан кам бўлмаган ҳолда қайтариш.
  Ижарага берувчи йўл ҳаракати қоидаларини бузганлиги ҳақида маълумот олса ижарага олувчи томонидан жарималар ўз вақтида сўзсиз тўланиши агар жарималар ўз вақтида қопланмаса З(уч) иш куни мобайнида ижарага берувчи томонидан депозит суммадан тўлашга хақли.
  Депозит сумма 2.000.000 миллон сўм (икки миллон сўм) бўлиши шарт;
  Ижарага берувчига ТВ эгаси сифатида жавобгарликка тортиш ва ижарага олувчи томонидан ТВдан фойдаланиш вақтида ҳар қандай зарар етказилиши ТВдан фойдаланганлиги сабабли учинчи шахсларнинг ҳаёти ёки соғлигига зарар стгазиш билан боғлиқ бўлган ҳар қандай йўқотиш ва харажатларни қоплаши. 
  ТВ тўлиќ зарарланган такдирда, кўрсатилган миқдорда унинг нархини қоплаш.
  Агар ижарага олувчи жиноят содир этса ва ижарага олинган ТВ жиноят иштирокчисига айланса, ижарага олувчи шахс, ижарага берувчи шахсга етказилаган барча сарф харажатни коплаб беришга МАЖБУР.
  Маст холда ва бошка маст килувчи дори воситалари таъсирида ТВ бошкариш КАТТИЯН МАН КИЛИНАДИ.
 
                 Ижарага олувчи ҳақли:
 
  Ижарага берувчининг айби билан нуқсонлар ёки носозликлар аниқланса, жойда бартараф етилишини талаб қилиш.
  Шартномани муддатидан олдин бекор қилишни талаб қилиш.
  Шартномани имзолашдан олдин ТВ га тегишли бўлган хужжатларни таьлаб қилиши шарт.
 
                 Ижарага олувчи кафолатлайди:
 
  Ўзбекистон ҳудудида амалдаги йўл ҳаракати коидалари билан танишган ва уларга риоя қилишни ўз зиммасига олади;
  Ижарага олувчи  ТВни бошқариш ҳуқуқига эга бўлган тегишли тоифадаги гувоҳномага эга бўлиши;
  ТВда чекишга, кузов ва эшикларнинг бўёқлари, қопламалар ва ички жиҳозларнинг яхлитлигини бузадиган буюмлар ва нарсаларни олиб юриш, автомашинанинг эркин бошқарувига халақит берадиган ва рухсат етилган максимал оғирликдан юқори бўлган нарса ва буюмларни олиб юришга йўл қўймайди.
  ТВни автохалокатга учратган холларда МЧЖ балансига 10.000.000 сўм миқдорда жарима тўлаб бериши лозим.
  ТВ 100 км тезликдан ошса базавий хисоблаш микдорининг 10 баробар жаримага тортилади. ТВ. шартнома килиб берилган вактдан олдин кайтарилса тулланган тулов суммаси ва ортикча ёкилги кайтариб берилмайди.

                                     Қўшимча
 
  Бу дастурда сизнинг телефон рақам, исм, фамилия ва манзил ма’лумотларингиздан фойдаланишимиз мумкун.
 
          ''';

  static const List<String> types = ['Start', 'Standart', 'Premium', 'Luxury'];
}
