$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'alpha'

@lists = [
  {
    name: 'mfl',
    can_move: true,
    positions: [
      "rnbqkb1r/1p3ppp/p2ppn2/8/3NP3/2N1BP2/PPP3PP/R2QKB1R b KQkq - 0 7",
      "rn1qkb1r/1p3ppp/p2pbn2/4p3/4P3/1NN1BP2/PPP3PP/R2QKB1R b KQkq - 0 8",
      "rnbqkb1r/1p3ppp/p2ppn2/8/3NP3/2N5/PPP1BPPP/R1BQK2R w KQkq - 0 7",
      "r1bqk2r/1p2bpp1/p1nppn1p/8/3NP3/2N1B3/PPPQ1PPP/2KR1B1R w kq - 0 10",
      "r1bqkb1r/5ppp/p1np1n2/1p2p1B1/4P3/N1N5/PPP2PPP/R2QKB1R w KQkq b6 0 9",
      "r1b1kbnr/ppqp1ppp/2n1p3/8/3NP3/2N5/PPP2PPP/R1BQKB1R w KQkq - 0 6",
      "rnbqkbnr/1p1p1ppp/p3p3/8/3NP3/8/PPP2PPP/RNBQKB1R w KQkq - 0 5",
      "rnbqkbnr/pp1ppppp/8/2p5/4P3/2P5/PP1P1PPP/RNBQKBNR b KQkq - 0 2",
      "rnbqkbnr/pp1ppppp/8/2p5/4P3/2N5/PPPP1PPP/R1BQKBNR b KQkq - 0 2",
      "r1bq1rk1/4bppp/p2p1n2/npp1p3/3PP3/2P2N1P/PPB2PP1/RNBQR1K1 b - d3 0 11",
      "rnbqkb1r/ppp2ppp/8/3p4/3Pn3/3B1N2/PPP2PPP/RNBQK2R b KQkq - 0 6",
      "rnbqk1nr/pp3ppp/4p3/2ppP3/3P4/P1P5/2P2PPP/R1BQKBNR b KQkq - 0 6",
      "rnbqkbnr/pp3ppp/4p3/2pp4/3PP3/8/PPPN1PPP/R1BQKBNR w KQkq c6 0 4",
      "rnbqkbnr/pp2pppp/2p5/3p4/3PP3/8/PPP2PPP/RNBQKBNR w KQkq d6 0 3",
      "rnbqkb1r/ppp1pp1p/3p1np1/8/3PP3/2N5/PPP2PPP/R1BQKBNR w KQkq - 0 4",
      "r1bqkb1r/p2n1ppp/2p1pn2/1p6/3P4/2NBPN2/PP3PPP/R1BQK2R b KQkq - 0 8",
      "r1bqk2r/pp1n1ppp/2pbpn2/3p4/2PP4/2N1PN2/PPQ2PPP/R1B1KB1R w KQkq - 0 7",
      "rnbqkb1r/pp3ppp/2p1pn2/3p2B1/2PP4/2N2N2/PP2PPPP/R2QKB1R b KQkq - 0 5",
      "rnbqkb1r/ppp2ppp/4pn2/3p4/2PP4/5NP1/PP2PP1P/RNBQKB1R b KQkq - 0 4",
      "rn1qk2r/p3bppp/bpp1pn2/3p4/2PP4/1PB2NP1/P3PPBP/RN1QK2R w KQkq d6 0 9",
      "rnbqkb1r/p1pp1ppp/1p2pn2/8/2PP4/P4N2/1P2PPPP/RNBQKB1R b KQkq - 0 4",
      "rnbq1rk1/pppp1ppp/4pn2/8/1bPP4/2NBP3/PP3PPP/R1BQK1NR b KQ - 0 5",
      "rnbq1rk1/p1pp1ppp/1p2pn2/8/2PP4/P1Q5/1P2PPPP/R1B1KBNR w KQ - 0 7",
      "r1bq1rk1/ppp1npbp/3p1np1/3Pp3/2P1P3/2N2N2/PP2BPPP/R1BQ1RK1 w - - 0 9",
      "rnbqk2r/ppp1ppbp/5np1/3p4/2PP4/2N2N2/PP2PPPP/R1BQKB1R w KQkq d6 0 5",
      "rnbqk2r/ppp1ppbp/6p1/8/3PP3/2P5/P4PPP/R1BQKBNR w KQkq - 0 7",
      "rnbq1rk1/ppp1ppbp/3p1np1/8/2PP4/5NP1/PP2PPBP/RNBQK2R w KQ - 0 6",
      "rn1qkb1r/pp2pppp/2p2n2/5b2/P1pP4/2N2N2/1P2PPPP/R1BQKB1R w KQkq - 0 6",
      "rnbqkb1r/ppp1pppp/5n2/8/2pP4/5N2/PP2PPPP/RNBQKB1R w KQkq - 0 4",
      "r1bqkb1r/pppp1ppp/2n2n2/4p3/2P5/2N2N2/PP1PPPPP/R1BQKB1R w KQkq - 0 4",
      "rnbqkb1r/pp1ppppp/5n2/2p5/2P5/2N2N2/PP1PPPPP/R1BQKB1R b KQkq - 0 3",
      "rnbqkbnr/ppp1pppp/8/3p4/8/5NP1/PPPPPP1P/RNBQKB1R b KQkq - 0 2"
    ]
  },
  {
    name: 'checkmate',
    can_move: false,
    positions: [
      '8/5r2/4K1q1/4p3/3k4/8/8/8 w - - 0 7',
      '4r2r/p6p/1pnN2p1/kQp5/3pPq2/3P4/PPP3PP/R5K1 b - - 0 2',
      'r3k2r/ppp2p1p/2n1p1p1/8/2B2P1q/2NPb1n1/PP4PP/R2Q3K w kq - 0 8',
      '8/6R1/pp1r3p/6p1/P3R1Pk/1P4P1/7K/8 b - - 0 4'
    ]
  },
  {
    name: 'stalemate',
    can_move: false,
    positions: [
      '1R6/8/8/8/8/8/7R/k6K b - - 0 1',
      '8/8/5k2/p4p1p/P4K1P/1r6/8/8 w - - 0 2'
    ]
  },
  {
    name: 'legal',
    can_move: true,
    positions: [
      'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
      '7k/3R4/3p2Q1/6Q1/2N1N3/8/8/3R3K w - - 0 1',
      'rnbqkbnr/pp3ppp/2pp4/4pP2/4P3/8/PPPP2PP/RNBQKBNR w KQkq e6 0 1',
      'rnbqkbnr/pppp2pp/8/4p3/4Pp2/2PP4/PP3PPP/RNBQKBNR b KQkq e3 0 1',
      'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
      'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1',
      '1nbqkbn1/pppp1ppp/8/4p3/4P3/8/PPPP1PPP/1NBQKBN1 b - - 1 2'
    ]
  }
]

def test_positions
  passed = 0
  failed = 0
  @lists.each_with_index do |list, i|
    print "\n\n(#{i}) #{list[:name].upcase} - can move: #{list[:can_move]} - #{list[:positions].length}n"
    list[:positions].each_with_index do |position, j|
      result = Alpha.search(fen: position, height: 4)
      print "\n\t(#{j}) "
      if result
        print "move made - "
        if list[:can_move]
          print "passed"
          passed += 1
        else
          print "failed"
          failed += 1
        end
      else
        if list[:can_move]
          print "move made - failed"
          failed += 1
        else
          print "couldn't move - passed"
          passed += 1
        end
      end
    end
  end
  print "\n\n #{passed + failed} positions | passed: #{passed} - failed: #{failed}"
end

test_positions
