# frozen_string_literal: true

module OrganizeFiles
  class FileOrder
    TYPES = {
      images: [".jpg", ".jpeg", ".png", ".gif", ".avif"],
      documents: [".pdf", ".docx", ".txt", ".md", ".json", ".csv", ".xls", ".xlsx", ".ppt", ".pptx"],
      audio: [".mp3", ".wav", ".flac"],
      videos: [".mp4", ".mkv", ".avi"],
      archives: [".zip", ".tar", ".rar", ".gz", ".7z", ".iso"],
      apks: [".apk"]
    }.freeze

    def initialize(file)
      @file = file
    end

    def categorize
      file_ext = File.extname(@file)
      category = TYPES.find { |_key, exts| exts.include?(file_ext) }
      return "Archives" unless category

      case category[0]
      when :images then "Pictures"
      when :documents then "Documents"
      when :audio then "Music"
      when :videos then "Videos"
      when :apks then "Apks"
      else
        "Archives"
      end
    end
  end
end
