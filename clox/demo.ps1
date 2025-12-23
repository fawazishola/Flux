# ============================================
# CLOX BYTECODE VM DEMO
# A Compiler and Virtual Machine Built from Scratch in C
# ============================================

$ErrorActionPreference = "SilentlyContinue"
Clear-Host

Write-Host ""
Write-Host "  +-----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host "  |                                                           |" -ForegroundColor Cyan
Write-Host "  |    CLOX - Bytecode Virtual Machine                        |" -ForegroundColor Yellow
Write-Host "  |                                                           |" -ForegroundColor Cyan
Write-Host "  |    A Compiler and VM Written in C                         |" -ForegroundColor White
Write-Host "  |    Following 'Crafting Interpreters' by Robert Nystrom    |" -ForegroundColor DarkGray
Write-Host "  |                                                           |" -ForegroundColor Cyan
Write-Host "  +-----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host ""

Start-Sleep -Milliseconds 1500

# Demo expressions
$demos = @(
    @{ expr = "1 + 2"; desc = "Basic Addition"; expected = "3" },
    @{ expr = "1 + 2 * 3"; desc = "Operator Precedence (* before +)"; expected = "7" },
    @{ expr = "(1 + 2) * 3"; desc = "Parentheses Override Precedence"; expected = "9" },
    @{ expr = "-5 + 8"; desc = "Unary Negation"; expected = "3" },
    @{ expr = "(-1 + 2) * 3 - -4"; desc = "Complex Expression"; expected = "7" },
    @{ expr = "3.14159 * 2"; desc = "Floating Point Math"; expected = "6.28318" },
    @{ expr = "100 / 4 / 5"; desc = "Left-to-Right Associativity"; expected = "5" },
    @{ expr = "((2 + 3) * (4 - 1)) / 3"; desc = "Nested Grouping"; expected = "5" }
)

Write-Host "  [ARCHITECTURE]" -ForegroundColor Magenta
Write-Host "  +-----------------------------------------------------------+" -ForegroundColor DarkGray
Write-Host "  |  Source Code -> Scanner -> Parser -> Compiler -> Bytecode |" -ForegroundColor White
Write-Host "  |                                              |             |" -ForegroundColor White
Write-Host "  |                              Stack-Based VM <- Execute     |" -ForegroundColor White
Write-Host "  +-----------------------------------------------------------+" -ForegroundColor DarkGray
Write-Host ""

Start-Sleep -Milliseconds 1000

Write-Host "  [COMPILATION PIPELINE DEMO]" -ForegroundColor Magenta
Write-Host ""

foreach ($demo in $demos) {
    Write-Host "  -----------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "  $($demo.desc)" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "    Expression: " -NoNewline -ForegroundColor Gray
    Write-Host "$($demo.expr)" -ForegroundColor Yellow
    
    # Run the expression
    $result = echo $demo.expr | .\main.exe 2>&1 | Select-Object -Last 2 | Select-Object -First 1
    $result = $result.Trim()
    
    Write-Host "    Result:     " -NoNewline -ForegroundColor Gray
    Write-Host "$result" -ForegroundColor Green
    Write-Host ""
    
    Start-Sleep -Milliseconds 800
}

Write-Host "  -----------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  [BYTECODE SAMPLE]" -ForegroundColor Magenta
Write-Host "  Expression: 1 + 2 * 3" -ForegroundColor Yellow
Write-Host ""
Write-Host "    0000  OP_CONSTANT    0 '1'     ; Push 1" -ForegroundColor DarkCyan
Write-Host "    0002  OP_CONSTANT    1 '2'     ; Push 2" -ForegroundColor DarkCyan
Write-Host "    0004  OP_CONSTANT    2 '3'     ; Push 3" -ForegroundColor DarkCyan
Write-Host "    0006  OP_MULTIPLY              ; 2 * 3 = 6" -ForegroundColor DarkCyan
Write-Host "    0007  OP_ADD                   ; 1 + 6 = 7" -ForegroundColor DarkCyan
Write-Host "    0008  OP_RETURN                ; Return 7" -ForegroundColor DarkCyan
Write-Host ""

Write-Host "  [STACK EXECUTION]" -ForegroundColor Magenta
Write-Host ""
Write-Host "    Step 1:  [ 1 ]              <- Push 1" -ForegroundColor White
Write-Host "    Step 2:  [ 1 ][ 2 ]         <- Push 2" -ForegroundColor White
Write-Host "    Step 3:  [ 1 ][ 2 ][ 3 ]    <- Push 3" -ForegroundColor White
Write-Host "    Step 4:  [ 1 ][ 6 ]         <- Multiply (2*3)" -ForegroundColor White
Write-Host "    Step 5:  [ 7 ]              <- Add (1+6)" -ForegroundColor White
Write-Host "    Step 6:  Return 7           <- Pop and return" -ForegroundColor Green
Write-Host ""

Write-Host "  -----------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  [TECH STACK]" -ForegroundColor Magenta
Write-Host "    * Language:      C (no dependencies)" -ForegroundColor White
Write-Host "    * Parser:        Pratt Parser (Operator Precedence)" -ForegroundColor White
Write-Host "    * Architecture:  Stack-Based Bytecode VM" -ForegroundColor White
Write-Host "    * Compilation:   Single-Pass (No AST)" -ForegroundColor White
Write-Host "    * Source:        Crafting Interpreters Chapter 17" -ForegroundColor White
Write-Host ""
Write-Host "  +-----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host "  |  Built from scratch. No libraries. Pure C.               |" -ForegroundColor White
Write-Host "  +-----------------------------------------------------------+" -ForegroundColor Cyan
Write-Host ""
