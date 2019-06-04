use CyclicDist;
config const numMessages=30;

const MessageSpace = {1..numMessages} dmapped Cyclic(startIdx=1);

forall msg in MessageSpace do
  writeln("Hello, world! (from iteration ", msg, " of ", numMessages,
          " owned by locale ", here.id, " of ", numLocales, ")");
