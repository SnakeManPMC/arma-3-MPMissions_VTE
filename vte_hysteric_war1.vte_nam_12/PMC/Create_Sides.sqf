// west is our player, that side is already created.
createCenter East;
createCenter Resistance;
createCenter West;

East setFriend [Resistance, 0];
East setFriend [West, 0];
Resistance setFriend [East, 0];
Resistance setFriend [West, 0];
West setFriend [East, 0];
West setFriend [Resistance, 0];
