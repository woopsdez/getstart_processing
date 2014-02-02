//上から描画していくので順番注意

float al = 0.0; //変数の定義と初期化
float va = 1; //色変化の速度 変数
float x = 0.0; //x軸の変数
float y = 0.0; //y軸の変数
float vx = random(-20, 20); //移動速度のランダム範囲 x
float vy = random(-20, 20); // yのとき
float r = 0.0; // 回転数値
float vr = 0.05; // 回転速度
float sc = 0.5;
float vsc = 0.01;

//luaと同じ？でグローバル変数みたいにする

// animate 特別な関数があります。
void setup() { //関数名をsetupに
	//初期化したら勝手に実行してくれる
	size(512, 512); // この中に書くのはおまじない	
	rectMode(CENTER); //基準点をセンターに
}

void draw() { // 1秒間に中の処理を60回呼び出す
	x += vx;
	y += vy;
	al += va; //alに1/60で0.1を足していく
	if ( al >= 255 || al < 0 ) { //255以上になったとき 
		va = -va;
	}
	if ( x >= width || x < 0 ) { //255以上になったとき 
		vx = -vx;
	}
	if ( y >= height || y < 0 ) { //255以上になったとき 
		vy = -vy;
	}
	background(0, 0, 0, 255);
	fill(255, 255, 255, al); //変数の呼出に頭に記号はなし
	translate(x, y); // translateで移動を設定
	rotate(r); //45度回転
	r += vr; //translateとrotateの順番が逆だと、結果が大きく変わるよ | 回転してからの移動か、移動中の回転かによるから
	sc += vsc;
	if (sc >= 1 || sc < 0.5 ) {
		vsc = -vsc;
	}
	scale(sc);
	rect( 0, 0, 250, 250); //位置を0にしてるけど、translateで移動してる
}
