% Gauss-Jordan elimination method to get matrix inverse 
% Matrix inverese --> [A|I] = [I|A^-1]

% Define the original matrix A
A = [4 -2 7;
     6 8 9;
     3 5 1];

% Define the identity matrix
I = eye(size(A));

% Create augmented matrix
augmented_matrix = [A, I];

% n = number of rows
% m = number of columns 

% Get the number of rows and columns
[n, m] = size(augmented_matrix);

% Elimination method for rows
for i = 1:n
    % Find the pivot row
    pivot_row = i;
    while augmented_matrix(pivot_row, i) == 0
        pivot_row = pivot_row + 1;
        if pivot_row > n
            error('Matrix is singular or nearly singular. Unable to proceed.');
        end
    end

    % Swap the current row with the pivot row
    augmented_matrix([i, pivot_row], :) = augmented_matrix([pivot_row, i], :);

    % Make the pivot element equal to 1
    augmented_matrix(i, :) = augmented_matrix(i, :) / augmented_matrix(i, i);

    % Eliminate other entries in the current column
    for j = 1:n
        if i ~= j
            augmented_matrix(j, :) = augmented_matrix(j, :) - augmented_matrix(j, i) * augmented_matrix(i, :);
        end
    end
end

% Extract the inverse matrix from the augmented matrix
A_inverse = augmented_matrix(:, n+1:end);

% Convert the matrix to symbolic fractions
fraction_A_inverse = rats(A_inverse);

disp('Original A matrix:');
disp(A);
disp('Inverse A matrix:');
disp(fraction_A_inverse);
