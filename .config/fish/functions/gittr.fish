function gittr --description "gittr <profile> <repo>"
    argparse h/help v/verbose -- $argv

    # Check for flags
    # Handle the -h/--help flag
    if set -q _flag_h
        echo "Usage: gittr <profile> <repo>"
        echo "Clone a GitHub repository using the specified profile."
        return 0
    end

    # Switch case to handle different scenarios
    switch (count $argv)
        case 0
            echo "Error: No arguments provided."
            echo "Use 'gittr -h' for help."
            return 1
        case 1
            echo "Error: Missing repository argument."
            echo "Usage: gittr <profile> <repo>"
            return 1
        case '*'
            # Ensure that at least two non-flag arguments are provided
            if test (count $argv) -lt 2
                echo "Error: You must provide both a profile and a repository."
                echo "Try 'gittr -h' for more information."
                return 1
            end
    end

    # Extract profile and repo
    set profile $argv[1]
    set repo $argv[2]

    # Check if the repo name ends with ".git", and append it if necessary
    if not string match -r '\.git$' $repo
        set repo "$repo.git"
    end

    # Proceed with git clone
    git clone "git@github-$profile:$repo"

    # Optional: Verbose flag example
    if set -q _flag_v
        echo "Cloning repository $repo as $profile..."
    end
end
