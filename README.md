# alpha.rb

tiny chess engine ~100 lines of ruby



## API

#### Alpha.search
```shell
2.3.1 :007 >   result = Alpha.search(fen: 'rnbqkb1r/ppp2ppp/8/3p4/3Pn3/3B1N2/PPP2PPP/RNBQK2R b KQkq - 0 6', height: 6)
 => #<struct Alpha::Result fen="r1bqkb1r/ppp2ppp/2n5/3p4/3Pn3/3B1N2/PPP2PPP/RNBQK2R w - - 0 6", move=#<struct Alpha::Move from=1, to=18, piece=1, target=6>, nodes=229505, clock=25.04846, board="\n ♜ _ ♝ ♛ ♚ ♝ _ ♜\n ♟ ♟ ♟ _ _ ♟ ♟ ♟\n _ _ ♞ _ _ _ _ _\n _ _ _ ♟ _ _ _ _\n _ _ _ ♙ ♞ _ _ _\n _ _ _ ♗ _ ♘ _ _\n ♙ ♙ ♙ _ _ ♙ ♙ ♙\n ♖ ♘ ♗ ♕ ♔ _ _ ♖">
2.3.1 :008 > result.serialize
 => {:fen=>"r1bqkb1r/ppp2ppp/2n5/3p4/3Pn3/3B1N2/PPP2PPP/RNBQK2R w - - 0 6", :nodes=>229505, :clock=>25.05, :nps=>9162, :board=>"\n ♜ _ ♝ ♛ ♚ ♝ _ ♜\n ♟ ♟ ♟ _ _ ♟ ♟ ♟\n _ _ ♞ _ _ _ _ _\n _ _ _ ♟ _ _ _ _\n _ _ _ ♙ ♞ _ _ _\n _ _ _ ♗ _ ♘ _ _\n ♙ ♙ ♙ _ _ ♙ ♙ ♙\n ♖ ♘ ♗ ♕ ♔ _ _ ♖", :move=>{:from=>"b8", :to=>"c6", :piece=>"n", :target=>"_"}}
```


#### Alpha.autoplay
``` shell
Alpha.autoplay(fen: '1nbqkbn1/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/1NBQKBN1 b - - 1 2', height: 4, turns: 2)
 _ ♞ ♝ _ ♚ ♝ ♞ _
 ♟ ♟ ♟ ♟ _ ♟ ♟ ♟
 _ _ _ _ _ _ _ _
 _ _ _ _ ♟ _ _ _
 _ _ _ _ ♙ _ _ ♛
 _ _ _ _ _ _ _ _
 ♙ ♙ ♙ ♙ _ ♙ ♙ ♙
 _ ♘ ♗ ♕ ♔ ♗ ♘ _

 _ ♞ ♝ _ ♚ ♝ ♞ _
 ♟ ♟ ♟ ♟ _ ♟ ♟ ♟
 _ _ _ _ _ _ _ _
 _ _ _ _ ♟ _ _ _
 _ _ _ _ ♙ _ ♙ ♛
 _ _ _ _ _ _ _ _
 ♙ ♙ ♙ ♙ _ ♙ _ ♙
 _ ♘ ♗ ♕ ♔ ♗ ♘ _
```

#### Alpha::Search.new
```shell
2.3.1 :006 > s = Alpha::Search.new
 => #<Alpha::Search:0x007fe84aa8e140 @fen="rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1", @height=6, @moves=[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], @colors=[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], @pieces=[3, 1, 2, 4, 5, 2, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 2, 4, 5, 2, 1, 3], @kings=[60, 4], @turn=1, @mx=0, @mn=1>
 ```

#### Alpha::Search.run
```shell
2.3.1 :007 > result = s.run
 => #<struct Alpha::Result fen="rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b - - 0 1", move=#<struct Alpha::Move from=52, to=36, piece=0, target=6>, nodes=43680, clock=3.350109, board="\n ♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜\n ♟ ♟ ♟ ♟ ♟ ♟ ♟ ♟\n _ _ _ _ _ _ _ _\n _ _ _ _ _ _ _ _\n _ _ _ _ ♙ _ _ _\n _ _ _ _ _ _ _ _\n ♙ ♙ ♙ ♙ _ ♙ ♙ ♙\n ♖ ♘ ♗ ♕ ♔ ♗ ♘ ♖">
2.3.1 :008 > puts result.board

 ♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜
 ♟ ♟ ♟ ♟ ♟ ♟ ♟ ♟
 _ _ _ _ _ _ _ _
 _ _ _ _ _ _ _ _
 _ _ _ _ ♙ _ _ _
 _ _ _ _ _ _ _ _
 ♙ ♙ ♙ ♙ _ ♙ ♙ ♙
 ♖ ♘ ♗ ♕ ♔ ♗ ♘ ♖
 => nil
2.3.1 :009 >

```

#### Alpha::Result.serialize
```shell
result.serialize
=> {:fen=>"rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b - - 0 1", :nodes=>43680, :clock=>3.35, :nps=>13038, :board=>"\n ♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜\n ♟ ♟ ♟ ♟ ♟ ♟ ♟ ♟\n _ _ _ _ _ _ _ _\n _ _ _ _ _ _ _ _\n _ _ _ _ ♙ _ _ _\n _ _ _ _ _ _ _ _\n ♙ ♙ ♙ ♙ _ ♙ ♙ ♙\n ♖ ♘ ♗ ♕ ♔ ♗ ♘ ♖", :move=>{:from=>"e2", :to=>"e4", :piece=>"p", :target=>"_"}}

2.3.1 :011 > require 'awesome_print'
 => true
2.3.1 :012 > ap result.serialize
{
      :fen => "rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b - - 0 1",
    :nodes => 43680,
    :clock => 3.35,
      :nps => 13038,
    :board => "\n ♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜\n ♟ ♟ ♟ ♟ ♟ ♟ ♟ ♟\n _ _ _ _ _ _ _ _\n _ _ _ _ _ _ _ _\n _ _ _ _ ♙ _ _ _\n _ _ _ _ _ _ _ _\n ♙ ♙ ♙ ♙ _ ♙ ♙ ♙\n ♖ ♘ ♗ ♕ ♔ ♗ ♘ ♖",
     :move => {
          :from => "e2",
            :to => "e4",
         :piece => "p",
        :target => "_"
    }
}
 => nil

```

## license
[MIT](./LICENSE)
