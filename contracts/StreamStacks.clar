(define-constant MAX-TOP-TIPPERS u10)
(define-map streamer-registry principal bool)
(define-map top-tippers principal uint) ;; total tips

(define-map tips
  {streamer: principal, sender: principal}
  {amount: uint})

;; Register as a streamer
(define-public (register-streamer)
  (begin
    (map-set streamer-registry tx-sender true)
    (ok "Registered as streamer")))

;; Tip a streamer
(define-public (tip-streamer (streamer principal) (amount uint))
  (begin
    (asserts! (is-eq (map-get? streamer-registry streamer) (some true)) (err u100))
    (try! (stx-transfer? amount tx-sender streamer))
    (let ((existing-tip (default-to u0 (get amount (map-get? tips {streamer: streamer, sender: tx-sender})))))
      (map-set tips {streamer: streamer, sender: tx-sender} {amount: (+ existing-tip amount)})
      ;; Update global tippers leaderboard
      (let ((total (default-to u0 (map-get? top-tippers tx-sender))))
        (map-set top-tippers tx-sender (+ total amount)))
      (ok "Tipped streamer!"))))

;; Read-only: Get amount tipped to a specific streamer
(define-read-only (get-tip-amount (streamer principal) (sender principal))
  (ok (get amount (default-to {amount: u0} (map-get? tips {streamer: streamer, sender: sender})))))

;; Get top tippers (to be used off-chain for badge minting)
(define-read-only (get-top-tippers)
  (ok (map-get? top-tippers tx-sender)))
