# asciiGame 🎮💻
view ascii images

Steps to project.
1. Read a file and print to screen.   
2. Create a function which get file name as parameter.
3. Create a menu:
3.1 Get a list of images
3.2 Print an image to the screen.
3.3 Play recognize the image.  
3.3.1 Random an image.  
3.3.2 Ask the user how many character he would like to guess.   
3.3.3 Print from the file till the end or number of character.   
3.3.4 Let the user guess or play again with the same image.
## פרטים על הפרויקט והעבודה

שם הפרוייקט: asciiGame

שם מתכנת: ישי חרמץ

[![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?username=IshayHarmatz)](https://github.com/anuraghazra/github-readme-stats)

מורה: ברק צוברי👑

כיתה: י'5

בית ספר: ישיבת בני עקיבא גבעת שמואל

 ![הורדה (11)](https://github.com/IshayHarmatz/asciiGame/assets/117118962/0321ac9c-8c7d-4d46-bf92-381b3e10799d)

שנת הגשה: 2023

#### מה התוכנית עושה-

התוכנית קולטת מהמשתמש עד 10 שמות של קבצים(שיניתי את הקבצים- BarakSuberi.txt, BebjaminNetanyahu.txt כדי שיעבדו במחשב במעבדה). אחר כך היא מגרילה קובץ מתוך הקבצים שהתקבלו.
המשתמש כותב כמה תווים הוא רוצה לראות מהקובץ והתוכנה מדפיסה בראש העמוד את הקובץ הרנדומלי לפי מספר התווים שהתקבלו מהמשתמש. 
לאחר מכן המשתמש יצטרך לנחש באיזה קובץ מדובר, אם יצליח תודפס הודעה מתאימה והתוכנית תגמר.
אם הוא יטעה תהיה לו אפשרות להמשיך במשחק או לסיים אותו. אם יבחר להמשיך לשחק יוכל לכתוב כמה תווים נוספים הוא רוצה לראות מהקובץ ואחר כך לנחש וחוזר חליליה. אם כל התווים בקובץ יודפסו למסך, יהיה למשתשמש רק ניסיון אחד לנחש נכון אחרת יפסיד.

#### הפעולות שהמשתמש יכול לבצע-

המשתמש יכול לקרוא את ההוראות של המשחק והוא יכול לשחק במשחק פעם אחת עד שהוא מנצח, פורש או שכל תווים בקובץ הודפסו.
בתוך המשחק עצמו המשתמש יכול להכניס עד 10 שמות של קבצים, הוא יכול לבחור כמה תווים לראות מהקובץ הרנדומלי.
המשתמש יכול גם להחליט אם הוא פורש או ממשיך לשחק אחרי שניחש לא נכון(אלא אם כן כל התווים כבר הודפסו).
אם הוא ממשיך לשחק הוא יכול לראות יותר תווים מהקובץ ולנחש...

#### תמונות ריצה עם הסברים

![צילום מסך 2023-06-01 193251](https://github.com/IshayHarmatz/asciiGame/assets/117118962/1d7a16e8-6aee-4ed2-92ce-2f0d2920f157)

בתמונה רואים שהתוכנית שואלת את המשתמש אם הוא רוצה לקרוא את ההוראות של המשחק או לא. במקרה זה המשתמש כתב a כלומר הוא רוצה לראות את ההוראות, לכן התוכנית הדפיסה את הוראות המשחק.

![צילום מסך 2023-05-31 231520](https://github.com/IshayHarmatz/asciiGame/assets/117118962/83717701-9d01-4ca7-875c-bf235c9c7b45)

בתמונה רואים שהתוכנית קולטת שמות של קבצים מהמשתמש. התוכנית תסיים את קליטת הקבצים אם המשתמש יכניס 0(כפי שרואים בתמונה) או עד שייקלטו 10 קבצים.

![צילום מסך 2023-06-01 194014](https://github.com/IshayHarmatz/asciiGame/assets/117118962/09103fb9-8bb9-4810-9919-0684245733fe)

בתמונה רואים שהתוכנית מבקשת מהמשתמש להכניס מספר מ0 עד 9999, שלפי מספר זה יודפסו למסך בהמשך כמות תווים מהקובץ המוגרל. אם המשתמש יכתוב משהו שהוא לא מספר התוכנית תכתוב הודעת שגיאה ותבקש ממנו להכניס מספר אחר (כפי שרואים בתמונה לעיל). אחרי שיוכנס מספר תקין התוכנית תתחיל להדפיס את הקובץ.

![צילום מסך 2023-06-01 195050](https://github.com/IshayHarmatz/asciiGame/assets/117118962/2026b102-64cc-4f4d-b88c-4a21d0f5e7c1)

בתמונה רואים שהתוכנית הדפיסה לתחילת המסך 1234 תווים(כפי שהוכנס בתמונה הקודמת) מהקובץ המוגרל. המשתמש היה צריך לנחש באיזה קובץ מדובר לפי מה שהתוכנית הדפיסה למסך. במקרה הזה המשתמש טעה בניחוש. בעקבות הטעות של המשתמש התוכנית שאלה אותו אם הוא רוצה להמשיך לשחק או לפרוש. המשתמש בחר להמשיך לשחק ולכן יכל להכניס עוד מספר של תווים אותו ירצה לראות מהקובץ (בנוסף למה שהודפס).

![צילום מסך 2023-06-01 200034](https://github.com/IshayHarmatz/asciiGame/assets/117118962/c32dc2ce-5ad4-4660-b876-e466774f01dd)

בתמונה ניתן לראות שהתוכנית הדפיסה לתחילת המסך עוד תווים מהקובץ (1234+2312)(לא ניתן לראות את כל הקובץ בו זמנית במסך אחד אך התוכנית מדפיסה את הקובץ מספיק איטי על מנת שהמשתמש יוכל לראות את כל הקובץ). במקרה הזה המשתמש ניחש נכון את שם הקובץ שהודפס על המסך. לכן התוכנית כתבה לו הודעה שמבשרת לו על שהצליח. לבסוף התוכנית תבקש ממנו להכניס תו כדי לצאת מהמשחק. 

#### שלבי וסדר פיתוח הפרויקט - 

את הפרויקט עשיתי שלב שלב. בהתחלה הדפסתי סתם קובץ כדי לראות שאני מצליח לעשות את זה. אחר כך קלטתי 4 שמות של קבצים והגרלתי קובץ אחד. 
אחר כך פיתחתי את המשחק שקולט את מספר התווים ומציג אותם, לבסוף עשיתי את הקוד שקולט ומשווה בין הניחוש של המשתמש לקובץ המודפס. אחרי זה בעצת המורה שלי שיניתי את הקוד והוספתי לו הוראות וקליטה של עד 10 שמות קבצים בצורה יעילה.

#### מה הייתי מוסיף לתוכנית בעתיד -

הייתי מוסיף את היכולת של המשתמש להחליט באיזה מיקום הוא רוצה שהתווים מהקובץ יודפסו(איזה שורה וטור). ככה יהיה למשתמש יותר יכולות וגם הוא יוכל לנסות לראות את החלקים בקובץ שלפי דעתו יעזרו לו לפענח את השאלה - באיזה קובץ מדובר? בנוסף הייתי מוסיף למשחק שלבים. כלומר, בהתחלה יהיה שלבים קלים שהוא יכול לראות את כל\רוב הקובץ ואז לנחש איזה קובץ זה. בהמשך יהיו שלבים קשים יותר שבהם המשתמש יוכל לראות כמות מצומצמת של תווים מהקובץ. ככה המשחק יהיה יותר מותח ומעניין.

#### סיכום אישי -

הפרויקט היה הזדמנות נהדרת להשתפר בכתיבת קוד בשפת assmbly. להכין פרויקט שלם מאפס היה מאוד מעניין ומגניב. 
הפרויקט היה קשה ולקח לי מלא שעות, אך שמחתי לעשות את הפרויקט וזה היה שווה את זה. 
הרגשתי שאני צריך להתגבר על מלא קשיים והרגשתי שהפגנתי יכולות רבות בביצוע הפרויקט.
הפרויקט עזר לי להבין איך לעשות פרויקטים ומשימות גדולות שלא בהכרח קשורות למחשבים, אלא פשוט דורשות התמדה ונחישות. 
הפרויקט הוא שילוב נפלא בין למידה והבנה טובה של החומר לבין הכנת משהו מעניין וכיף.
![הורדה](https://github.com/IshayHarmatz/asciiGame/assets/117118962/8141ce8e-8882-4421-b3f5-2cc83a87a6c7)
