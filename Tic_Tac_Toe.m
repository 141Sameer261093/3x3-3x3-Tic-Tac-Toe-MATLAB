display('welcome to 3x3:3x3 Tic-Tac-Toe');

game = 'standby';

start_playing = input('start playing ? enter 1 to continue. for more information, enter 2. enter = ');


if (start_playing == 2)
    disp('Check out this <a href="http://www.quora.com/Whats-the-best-hack-edit-to-make-the-boring-Tic-Tac-Toe-game-more-interesting">Quora Page</a> for more information.');
    disp('(This link will be opened in the Matlab Browser. Run Tic_Tac_Toe after reading.');
end


if (start_playing == 1)

    disp('Note : enter _ to quit the game midway!');

    show_board1 = zeros(9,9);

    for x=0:2
        for y=0:2
            for i=1:3
                for j=1:3
                    show_board1(x*3+i, y*3+j) = x*3+y+1;
                end
            end
        end
    end

    disp('the following matrix shows how the sub-boards are numbered.');
    display(show_board1);

    show_board2 = zeros(3,3);

            for i=1:3
                for j=1:3
                    show_board2(i, j) = (i-1)*3+j;
                end
            end

    disp('the following matrix shows how each place is numbered in a sub-board.');
    display(show_board2);


    disp('play-board is the whole 3x3:3x3 board.');
    disp('sub-board is the one where current mark is to be put.');
    disp('main-board is the one which players have to eventually win.');

    count = 0;
    game = 'running';

    play_board = zeros(9,9);
    main_board = zeros(3,3);
    sub_board = zeros(3,3);

    place_current = [1,1];
    place_new = [1,1];

    message1 = fprintf('player 1 can choose the sub-board to put first mark = ');
    place = take_input();

            place_current(1,1) = floor((place-1)/3);
            place_current(1,2) = rem((place-1), 3);


    while strcmp(game, 'running')

            player = rem(count, 2) + 1;

            while ( main_board( place_current(1,1) + 1 , place_current(1,2) + 1 ) ~= 0 )

                    message5 = fprintf('as the sub-board indicated by previous mark is alredy won;\n player %d can freely choose freely sub-board to put next mark = ', player);
                    place = take_input();

                    place_current(1,1) = floor((place-1)/3);
                    place_current(1,2) = rem((place-1), 3);

            end

            sub_board = play_board( place_current(1,1)*3 +1 : place_current(1,1)*3 +3 , place_current(1,2)*3 +1 : place_current(1,2)*3 +3 );

        display(play_board);

        display(sub_board);

        message1 = fprintf('player %d put your mark = ', player);
        place = take_input();

            place_new(1,1) = floor((place-1)/3) + 1;
            place_new(1,2) = rem((place-1), 3) + 1;


            while play_board( place_new(1,1)+ place_current(1,1)*3 , place_new(1,2)+ place_current(1,2)*3 ) ~= 0
                  message3 = fprintf('error: place alredy marked; player %d play again = ', player);
                  place = take_input();

                  place_new(1,1) = floor((place-1)/3) + 1;
                  place_new(1,2) = rem((place-1), 3) + 1;
            end

        play_board(place_new(1,1)+ place_current(1,1)*3 , place_new(1,2)+ place_current(1,2)*3) = (player-1)*8 + 1;

        sub_board = play_board( place_current(1,1)*3 +1 : place_current(1,1)*3 +3 , place_current(1,2)*3 +1 : place_current(1,2)*3 +3 );
        win_sub = check_winner(sub_board);

                if win_sub == 1

                   message4 = fprintf('player %d won a sub-board\n', player);
                   play_board( place_current(1,1)*3 +1 : place_current(1,1)*3 +3 , place_current(1,2)*3 +1 : place_current(1,2)*3 +3 ) = (player-1)*8 + 1;

                   main_board( place_current(1,1) + 1 , place_current(1,2) + 1 ) = (player-1)*8 + 1;
                   win_main = check_winner(main_board);

                       if win_main == 1

                           message6 = fprintf('Congratulations : player %d won the game', player);
                           game = 'over';

                       end

                    display(main_board);

                end

                count = count + 1;
                place_current = place_new - 1;

     end

    message7 = fprintf('GAME OVER\n');

end
