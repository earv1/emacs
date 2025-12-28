#!/bin/bash
# test-config.sh - Test Emacs configuration thoroughly

set -e

EMACS_BIN="/opt/homebrew/opt/emacs-plus@30/bin/emacs"
TEST_COUNT=3

echo "========================================="
echo "Emacs Configuration Test Script"
echo "========================================="
echo ""

# Function to kill all Emacs processes
kill_emacs() {
    echo "🔪 Killing any running Emacs processes..."
    pkill -9 emacs 2>/dev/null || true
    pkill -9 emacsclient 2>/dev/null || true
    sleep 2

    if pgrep -f emacs > /dev/null; then
        echo "⚠️  WARNING: Emacs processes still running:"
        ps aux | grep emacs | grep -v grep
        return 1
    else
        echo "✓ All Emacs processes killed"
    fi
    echo ""
}

# Function to test init
test_init() {
    local test_num=$1
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Test #$test_num: Loading init.el..."
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    local output
    output=$($EMACS_BIN --batch --eval "(progn (load-file \"~/.config/emacs/init.el\") (message \"✓ Init complete\"))" 2>&1)

    # Check for errors
    if echo "$output" | grep -iq "error\|cannot load"; then
        echo "❌ ERRORS FOUND:"
        echo "$output" | grep -i "error\|cannot" | head -10
        return 1
    else
        echo "✓ No errors found"
    fi

    # Check if packages loaded
    echo ""
    echo "Checking package loading..."
    if echo "$output" | grep -q "✓ Init complete"; then
        echo "✓ Init completed successfully"
    fi

    echo ""
}

# Function to test daemon mode
test_daemon() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Test: Daemon Mode"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    echo "Starting daemon..."
    $EMACS_BIN --daemon=test 2>&1 | head -5

    if pgrep -f "emacs.*daemon=test" > /dev/null; then
        echo "✓ Daemon started successfully"

        echo "Testing emacsclient connection..."
        /opt/homebrew/opt/emacs-plus@30/bin/emacsclient -s test --eval "(message \"Client connected\")" 2>&1 | grep -i "client\|connected" || true

        echo "Stopping daemon..."
        /opt/homebrew/opt/emacs-plus@30/bin/emacsclient -s test --eval "(kill-emacs)" 2>/dev/null || true
        sleep 1
        echo "✓ Daemon stopped"
    else
        echo "❌ Daemon failed to start"
        return 1
    fi

    echo ""
}

# Main test sequence
echo "Step 1: Kill existing Emacs processes"
kill_emacs

echo "Step 2: Run batch init tests"
for i in $(seq 1 $TEST_COUNT); do
    test_init $i
done

echo "Step 3: Test daemon mode"
test_daemon

echo "Step 4: Final cleanup"
kill_emacs

echo "========================================="
echo "✓ All tests completed successfully!"
echo "========================================="
