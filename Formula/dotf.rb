class Dotf < Formula
  desc "Modular dotfile manager using git bare repo with sparse checkout"
  homepage "https://github.com/abjoru/dotf-v3"
  version "3.0.9"
  url "https://github.com/abjoru/dotf-v3/releases/download/v#{version}/dotf-v#{version}-macos-arm64"
  sha256 "c52afa1d9815024608bb72667995eb6ce0f19be629ba694ea2a6c26de61807af"
  license "BSD-3-Clause"

  depends_on :macos
  depends_on "git"

  def install
    bin.install "dotf-v#{version}-macos-arm64" => "dotf"

    (zsh_completion/"_dotf").write <<~ZSH
      #compdef dotf

      local request
      local completions
      local word
      local index=$((CURRENT - 1))

      request=(--bash-completion-enriched --bash-completion-index $index)
      for arg in ${words[@]}; do
        request=(${request[@]} --bash-completion-word $arg)
      done

      IFS=$'\\n' completions=($( $(command -v dotf) "${request[@]}" ))

      for word in $completions; do
        local -a parts

        # Split the line at a tab if there is one.
        IFS=$'\\t' parts=($( echo $word ))

        if [[ -n $parts[2] ]]; then
           if [[ $word[1] == "-" ]]; then
             local desc=("$parts[1] ($parts[2])")
             compadd -d desc -- $parts[1]
           else
             local desc=($(print -f  "%-019s -- %s" $parts[1] $parts[2]))
             compadd -l -d desc -- $parts[1]
           fi
        else
          compadd -f -- $word
        fi
      done
    ZSH
  end

  test do
    system "#{bin}/dotf", "--help"
  end
end
