//上から描画していくので順番注意

float al = 0.0; //変数の定義と初期化
float va = 1; //色変化の速度 変数
float x = 0.0; //x軸の変数
float y = 0.0; //y軸の変数
float vx = random(-20, 20); //移動速度のランダム範囲 x
float vy = random(-20, 20); // yのとき

//luaと同じ？でグローバル変数みたいにする

// animate 特別な関数があります。
void setup() { //関数名をsetupに
	//初期化したら勝手に実行してくれる
	size(512, 512); // この中に書くのはおまじない	
	rectMode(CENTER);
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
	rect( x, y, 250, 250);
}
